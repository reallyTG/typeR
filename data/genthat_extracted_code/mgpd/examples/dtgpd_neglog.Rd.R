library(mgpd)


### Name: dtgpd_neglog
### Title: internal
### Aliases: dtgpd_neglog
### Keywords: internal

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (x, y, z, mar1 = c(0, 1, 0.1), mar2 = c(0, 1, 0.1), 
    mar3 = c(0, 1, 0.1), dep = 1.5) 
{
    error = FALSE
    hxyz = NULL
    param = as.numeric(c(mar1, mar2, mar3, dep))
    mux = param[1]
    muy = param[4]
    muz = param[7]
    sigx = param[2]
    sigy = param[5]
    sigz = param[8]
    gamx = param[3]
    gamy = param[6]
    gamz = param[9]
    alpha = param[10]
    if (gamx > 0) {
        epx1 = mux - sigx/gamx
        epx2 = Inf
    }
    else {
        epx1 = -Inf
        epx2 = mux - sigx/gamx
    }
    if (gamy > 0) {
        epy1 = muy - sigy/gamy
        epy2 = Inf
    }
    else {
        epy1 = -Inf
        epy2 = muy - sigy/gamy
    }
    if (gamz > 0) {
        epz1 = muz - sigz/gamz
        epz2 = Inf
    }
    else {
        epz1 = -Inf
        epz2 = muz - sigz/gamz
    }
    if ((min(x) < epx1) | (max(x) > epx2)) {
        error = T
    }
    if ((min(y) < epy1) | (max(y) > epy2)) {
        error = T
    }
    if ((min(z) < epz1) | (max(z) > epz2)) {
        error = T
    }
    if (sigx < 0 | sigy < 0 | sigz < 0 | alpha < 0) {
        error = T
    }
    if (!error) {
        hxyz = NA
        tx = tr(x, gamx, mux, sigx)
        ty = tr(y, gamy, muy, sigy)
        tz = tr(z, gamz, muz, sigz)
        tx0 = tr(0, gamx, mux, sigx)
        tz0 = tr(0, gamy, muy, sigy)
        ty0 = tr(0, gamz, muz, sigz)
        dtx = dtr(x, gamx, mux, sigx)
        dty = dtr(y, gamy, muy, sigy)
        dtz = dtr(z, gamz, muz, sigz)
        c0 = -1/muneglog(tx0, ty0, tz0, alpha = alpha, A1 = 0, 
            A2 = 0.001)
        dddpsimu = d123muneglog(tx, ty, tz, alpha = alpha, A1 = 0, 
            A2 = 0.001)
        Jc = dtx * dty * dtz
        null = (1 - ((tx < tx0) * (ty < ty0) * (tz < tz0)))
        hxyz = -c0 * dddpsimu * null * Jc
    }
    else print("invalid parameter(s)")
    hxyz
  }



