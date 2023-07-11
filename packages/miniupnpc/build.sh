TERMUX_PKG_HOMEPAGE=https://miniupnp.tuxfamily.org/
TERMUX_PKG_DESCRIPTION="Small UPnP client library and tool to access Internet Gateway Devices"
TERMUX_PKG_LICENSE="BSD 3-Clause"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=2.2.5
TERMUX_PKG_SRCURL=https://github.com/miniupnp/miniupnp/archive/refs/tags/miniupnpc_${TERMUX_PKG_VERSION//./_}.tar.gz
TERMUX_PKG_SHA256=feb2ce11c548115f6e7dead7a523790aceeca92b9fca718f26e5b22303af313c
TERMUX_PKG_BREAKS="miniupnpc-dev"
TERMUX_PKG_REPLACES="miniupnpc-dev"

termux_step_post_make_install() {
	ln -sfT upnpc-static "$TERMUX_PREFIX/bin/upnpc"
}

termux_step_post_massage() {
	local _EXTERNAL_IP="bin/external-ip.sh"
	if [ -f "${_EXTERNAL_IP}" ]; then
		chmod 0700 "${_EXTERNAL_IP}"
	fi
}
