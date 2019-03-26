library(DTAT)


### Name: de.bioRxiv.240846
### Title: Simulated '3+3/PC' dose-titration study from bioRxiv paper no.
###   240846
### Aliases: de.bioRxiv.240846
### Keywords: datasets

### ** Examples


data(de.bioRxiv.240846)
# Demonstrate that the new S4 3+3/PC implementation reproduces the
# simulated trial from the paper:
set.seed(2017)
CV <- 0.7; mean_mtd <- 1.0
shape <- CV^-2; scale <- mean_mtd/shape
trial <- new("DE", doses=0.25 * 1.4^(0:6),
             MTDi=rgamma(24, shape=shape, scale=scale),
             units="mg")
trial <- titration(trial, periods=10)
stopifnot(all(trial@data == de.bioRxiv.240846[[10]]))
stopifnot(trial@stop_esc == attr(de.bioRxiv.240846[[10]],'stop.esc'))




