## ----setup, echo=FALSE, include=FALSE------------------------------------
library(PKNCA)
library(knitr)
library(lattice)

## ----showtheoph----------------------------------------------------------
## It is always a good idea to look at the data
knitr::kable(head(datasets::Theoph))

## ----setupconc-----------------------------------------------------------
## By default it is groupedData; convert it to a data frame for use
my.conc <- PKNCAconc(as.data.frame(datasets::Theoph), conc~Time|Subject)

## ----superposition, error=TRUE-------------------------------------------
steady.state <- superposition(my.conc, tau=24)

## ----findnonzero---------------------------------------------------------
knitr::kable(subset(datasets::Theoph, Time == 0 & conc > 0),
             caption="Nonzero predose measurements")

## ----allownonzero--------------------------------------------------------
## Correct nonzero concentrations at time 0 to be BLQ.
theoph.corrected <- datasets::Theoph
theoph.corrected$conc[theoph.corrected$Time == 0] <- 0
my.conc.corrected <- PKNCAconc(theoph.corrected, conc~Time|Subject)

## Calculate the new steady-state concentrations with 24 hour dosing
steady.state <- superposition(my.conc.corrected, tau=24)
knitr::kable(head(steady.state, n=14),
             caption="Superposition at steady-state")

## ----UnsteadyState-------------------------------------------------------
## Calculate the unsteady-state concentrations with 24 hour dosing
unsteady.state <- superposition(my.conc.corrected, tau=24, n.tau=2)
knitr::kable(head(unsteady.state, n=14),
             caption="Superposition before steady-state")

## ----ComplexInterval-----------------------------------------------------
## Calculate the new steady-state concentrations with 24 hour dosing
complex.interval.steady.state <- superposition(my.conc.corrected, tau=24, dose.times=c(0, 2, 4))
knitr::kable(head(complex.interval.steady.state, n=10),
             caption="Superposition at steady-state with complex dosing")
xyplot(conc~time, groups=Subject, type="l",
       data=complex.interval.steady.state)

## ----to_steady_state-----------------------------------------------------
up.to.steady.state <- superposition(my.conc.corrected,
                                    tau=4*24,
                                    n.tau=1,
                                    dose.times=seq(0, 3*24, by=12))
xyplot(conc~time,
       groups=Subject,
       data=up.to.steady.state,
       type="l")

## ------------------------------------------------------------------------
steady.state$time[steady.state$Subject == 1]
sum(steady.state$Subject == 1)
complex.interval.steady.state$time[complex.interval.steady.state$Subject == 1]
sum(complex.interval.steady.state$Subject == 1)

