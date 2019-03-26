library(Benchmarking)


### Name: sfa
### Title: Stochastic frontier estimation
### Aliases: sfa lambda.sfa logLik.sfa print.sfa residuals.sfa sigma2.sfa
###   sigma2u.sfa sigma2v.sfa summary.sfa coef.sfa te.sfa teJ.sfa teBC.sfa
###   teMode.sfa te.add.sfa
### Keywords: sfa efficiency

### ** Examples

# Example from the book by Coelli et al.
# d <- read.csv("c:/0work/rpack/front41Data.csv", header = TRUE, sep = ",")
# x <- cbind(log(d$capital), log(d$labour))
# y <- matrix(log(d$output))

n <- 50
x1 <- 1:50 + rnorm(50,0,10)
x2 <- 100 + rnorm(50,0,10)
x <- cbind(x1,x2)
y <- 0.5 + 1.5*x1 + 2*x2 + rnorm(n,0,1) - pmax(0,rnorm(n,0,1))
sfa(x,y)
summary(sfa(x,y))


# Estimate efficiency for each unit
o <- sfa(x,y)
eff(o)

te <- te.sfa(o)
teM <- teMode.sfa(o)
teJ <- teJ.sfa(o)
cbind(eff(o),te,Mode=eff(o, type="Mode"),teM,teJ)[1:10,]


sigma2.sfa(o)       # Estimated varians
lambda.sfa(o)       # Estimated lambda



