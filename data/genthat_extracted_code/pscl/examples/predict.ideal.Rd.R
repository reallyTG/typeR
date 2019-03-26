library(pscl)


### Name: predict.ideal
### Title: predicted probabilities from an ideal object
### Aliases: predict.ideal print.predict.ideal
### Keywords: classes

### ** Examples

data(s109)

f <- system.file("extdata","id1.rda",package="pscl")
load(f)
phat <- predict(id1)
phat         ## print method



