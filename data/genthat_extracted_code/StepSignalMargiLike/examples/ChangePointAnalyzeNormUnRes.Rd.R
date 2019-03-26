library(StepSignalMargiLike)


### Name: ChangePointAnalyzeNormUnRes
### Title: ChangePointAnalyzeNormUnRes
### Aliases: ChangePointAnalyzeNormUnRes

### ** Examples

n <- 5
data.x <- rnorm(n, 1, 1)
data.x <- c(data.x, rnorm(n, 10,1))
data.x <- c(data.x, rnorm(n, 2,1))
data.x <- c(data.x, rnorm(n, 10,1))
data.x <- c(data.x, rnorm(n, 1,1))
data.t <- 1:(5*n)

prior <- prior.norm.A(data.x)

ChangePointAnalyzeNormUnRes(data.x, n, prior)



