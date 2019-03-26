library(surveillance)


### Name: knox
### Title: Knox Test for Space-Time Interaction
### Aliases: knox plot.knox toLatex.knox
### Keywords: htest

### ** Examples

data("imdepi")
imdepiB <- subset(imdepi, type == "B")

## Perfom the Knox test using the Poisson approximation
knoxtest <- knox(
    dt = dist(imdepiB$events$time), eps.t = 30,
    ds = dist(coordinates(imdepiB$events)), eps.s = 50,
    simulate.p.value = FALSE
)
knoxtest
## The Poisson approximation works well for these data since
## the proportion of close pairs is rather small (204/56280).

## contingency table in LaTeX
toLatex(knoxtest)


if (surveillance.options("allExamples")) {
    ## Obtain the p-value via a Monte Carlo permutation test,
    ## where the permutations can be computed in parallel
    ## (using forking on Unix-alikes and a cluster on Windows, see ?plapply)
    knoxtestMC <- knox(
        dt = dist(imdepiB$events$time), eps.t = 30,
        ds = dist(coordinates(imdepiB$events)), eps.s = 50,
        simulate.p.value = TRUE, B = 999,
        .parallel = 2, .seed = 1, .verbose = FALSE
    )
    knoxtestMC
    plot(knoxtestMC)
}



