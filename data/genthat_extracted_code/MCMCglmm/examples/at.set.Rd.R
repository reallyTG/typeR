library(MCMCglmm)


### Name: at.set
### Title: Incidence Matrix of Combined Levels within a Factor
### Aliases: at.set
### Keywords: manip

### ** Examples

fac<-gl(3,10,30, labels=letters[1:3])
x<-rnorm(30)
model.matrix(~at.set(fac,2:3):x)



