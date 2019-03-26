library(NPCirc)


### Name: bw.pi
### Title: Plug-in rule
### Aliases: bw.pi
### Keywords: circular density

### ** Examples

set.seed(2012)
n <- 100
x <- rcircmix(n,model=18)
bw.pi(x, M=3)
bw.pi(x, outM=TRUE)  # Using AIC



