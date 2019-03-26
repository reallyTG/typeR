library(StepSignalMargiLike)


### Name: StepSignalMargiLike_ChangePointAnalyzePoissUnRes
### Title: StepSignalMargiLike_ChangePointAnalyzePoissUnRes
### Aliases: StepSignalMargiLike_ChangePointAnalyzePoissUnRes

### ** Examples

n <- 20

data.x <- rpois(n, 1)
data.x <- c(data.x, rpois(n, 10))
data.x <- c(data.x, rpois(n, 50))
data.x <- c(data.x, rpois(n, 20))
data.x <- c(data.x, rpois(n, 80))

prior <- prior.pois(data.x)

ChangePointAnalyzePoissUnRes(data.x, n, prior)



