library(VLMC)


### Name: simulate.vlmc
### Title: Simulate a Discrete Time Series from fitted VLMC model
### Aliases: simulate.vlmc
### Keywords: ts models

### ** Examples

example(vlmc)

simulate(vlmc.dt1, 100)
simulate(vlmc.dt1c01, 100, int = TRUE)
# n.start = 0: 1st few observations will resemble the data
simulate(vlmc.dt1c01, 20, n.start=0, int = TRUE)

## Don't show: 
## technical consistency checks
ww <- tools::assertWarning(sv <- simulate.vlmc(vlmc.dt1, 100))# deprecation
s2 <- simulate(vlmc.dt1c01, 16, n.start=100, int = TRUE, keep.RSeed=FALSE)
.Random.seed <- attr(sv,"seed")
s3 <- simulate(vlmc.dt1, n=100)
stopifnot(length(sv) == 100, length(s2) == 16, identical(sv, s3),
	  grepl("deprecated", ww[[1]][["message"]]),
	  !is.na(match(names(attributes(s2)), c("name","class"))))
## End(Don't show)



