library(emulator)


### Name: sample.n.fit
### Title: Sample from a Gaussian process and fit an emulator to the points
### Aliases: sample.n.fit
### Keywords: models

### ** Examples


sample.n.fit(main="Default: scales match")
sample.n.fit(scales.generate=5,main="generate scale small")
sample.n.fit(scales.fit=5,main="fit scales small",sub="note vertical scale")
sample.n.fit(scales.fit=5,main="fit scales small",ylim=c(-3,3),
     sub="note appropriate interpolation, bad extrapolation")

# Now use a quadratic function instead of the default linear:
 f <- function(x){out <- c(1,x,x^2)
 names(out) <- c("const","linear","quadratic")
 out}

sample.n.fit(main="quadratic prior" , func=f)





