library(MCMCglmm)


### Name: at.level
### Title: Incidence Matrix of Levels within a Factor
### Aliases: at.level
### Keywords: manip

### ** Examples

fac<-gl(3,10,30, labels=letters[1:3])
x<-rnorm(30)
model.matrix(~at.level(fac,"b"):x)



