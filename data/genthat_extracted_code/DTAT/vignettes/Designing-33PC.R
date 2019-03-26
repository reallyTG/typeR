## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
knitr::opts_chunk$set(fig.width = 5)
# Notwithstanding the advice offered in the package:htmlwidgets docs (see link),
# setting self_contained = TRUE (**) proved necessary for embedding the D3 viz.
# https://cran.r-project.org/web/packages/widgetframe/vignettes/widgetframe_and_knitr.html 
knitr::opts_chunk$set(widgetframe_self_contained = TRUE)  # **
knitr::opts_chunk$set(widgetframe_isolate_widgets = TRUE) # default = TRUE

library(lattice)
library(r2d3)
library(widgetframe)
library(DTAT)

## ----density, fig.cap="**A postulated distribution of MTD~i~.**"---------
# You might find it easiest to think in terms of CV and median:
CV <- 0.7    # coefficient of variation of MTDi
MTDi50 <- 75 # median MTDi (i.e., 50th percentile)
# But R's Gamma distribution will expect that information
# expressed in terms of 'shape' and 'scale' parameters:
shape <- CV^-2
scale <- MTDi50/qgamma(0.5, shape=CV^-2)
# Plot:
MTDi <- 0:200
dens <- dgamma(MTDi, shape=shape, scale=scale)
xyplot(dens ~ MTDi, type = "l"
       , xlab = expression(MTD[i]*' [mg/kg]')
       , ylab = "density")

## ----cumdist, fig.cap="**A postulated cumulative distribution of MTD~i~.**"----
F <- pgamma(MTDi, shape=shape, scale=scale)
xyplot(F ~ MTDi, type = "l"
       , xlab = expression(MTD[i]*' [mg/kg]')
       , ylab = "Cumulative Distribution"
       , panel = function(...){
         panel.xyplot(...)
         panel.refline(h=0.5)
         panel.refline(v=MTDi50)
       })

## ----dose-survival, fig.cap="**The 'dose-survival curve' implied by the posited distribution of MTD~i~.**"----
xyplot((1-F) ~ MTDi, type = "l"
       , xlab = "Dose [mg/kg]"
       , ylab = "Fraction Tolerant")

## ----discrete-doses------------------------------------------------------
doses <- 25 * (200/25)^(0:6/6) # geometric sequence 25..200
doses <- round(doses/5)*5      # round to the nearest 5 mg/kg
names(doses) <- 1:7            # label the doses 1..7
doses

## ----doses-in-context, fig.cap="**Discrete doses spanning our anticipated MTD~i~ distribution.**"----
xyplot(dens ~ MTDi, type = "l"
       , xlab = expression(MTD[i]*' [mg/kg]')
       , ylab = "density"
       , scales = list(x=list(log=FALSE, at=doses)))

## ----doses-in-context-2, fig.cap="**Discrete doses spanning our anticipated MTD~i~ distribution, with logarithmic dose scaling.**"----
xyplot((dens*MTDi) ~ MTDi, type = "l"
       , xlab = expression(MTD[i]*' [mg/kg]')
       , xlim = c(10, 200)
       , ylab = expression("density of",log(MTD[i]))
       , scales = list(x=list(log=TRUE, at=doses)))

## ----doses-in-context-3, fig.cap="**Discrete doses spanning our anticipated dose-survival curve, with logarithmic dose scaling.**"----
xyplot((1-F) ~ MTDi, type = "l"
       , xlab = "Dose [mg/kg]"
       , xlim = c(20, 200)
       , ylab = "Fraction Tolerant"
       , scales = list(x=list(log=TRUE, at=doses)))

## ----trial-realization, fig.height=5, fig.align="left", fig.cap="**This plot is interactive! Roll over the participant IDs and the (X and O) markers to trace individual participants through their respective titration courses. Click on the period dividers to see what information has accrued by various points in the trial.**"----
N <- 24
set.seed(2019) # setting RNG seed makes sim reproducible
trial <- new("DE", doses=doses,
             MTDi=rgamma(N, shape=shape, scale=scale),
             units="mg/kg")
trial <- titration(trial, periods=10)
viz <- plot(trial)

## ----D3-viz, echo=FALSE--------------------------------------------------
frameWidget(viz, height='350')

## ----start-the-app, eval=FALSE-------------------------------------------
#  runDTATapp('Sim33PC')

