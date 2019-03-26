## ------------------------------------------------------------------------
## Load libraries
library(ggplot2)
library(nlmixr)

str(theo_sd)

ggplot(theo_sd, aes(TIME, DV)) + geom_line(aes(group=ID), col="red") + scale_x_continuous("Time (h)") + scale_y_continuous("Concentration") + labs(title="Theophylline single-dose", subtitle="Concentration vs. time by individual")


## ------------------------------------------------------------------------
one.cmt <- function() {
    ini({
        tka <- .5   # log Ka
        tcl <- -3.2 # log Cl
        tv <- -1    # log V
        eta.ka ~ 1
        eta.cl ~ 2
        eta.v ~ 1
        add.err <- 0.1
    })
    model({
        ka <- exp(tka + eta.ka)
        cl <- exp(tcl + eta.cl)
        v <- exp(tv + eta.v)
        linCmt() ~ add(add.err)
    })
}

## ------------------------------------------------------------------------
fit <- nlmixr(one.cmt, theo_sd, est="nlme")
print(fit)

## ------------------------------------------------------------------------
one.compartment.saem <- function() {
    ini({
        tka <- .5   # Log Ka
        tcl <- -3.2 # Log Cl
        tv <- -1    # Log V
        eta.ka ~ 1
        eta.cl ~ 2
        eta.v ~ 1
        add.err <- 0.1
    })
    model({
        ka <- exp(tka + eta.ka)
        cl <- exp(tcl + eta.cl)
        v <- exp(tv + eta.v)
        d/dt(depot) = -ka * depot
        d/dt(center) = ka * depot - cl / v * center
        cp = center / v 
        cp ~ add(add.err)
    })
}

