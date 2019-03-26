library(pscl)


### Name: plot.predict.ideal
### Title: plot methods for predictions from ideal objects
### Aliases: plot.predict.ideal
### Keywords: hplot

### ** Examples

data(s109)
f = system.file("extdata","id1.rda",package="pscl")
load(f)
phat <- predict(id1)
plot(phat,type="legis")
plot(phat,type="votes")



