library(gld)


### Name: print.starship
### Title: Print (or summarise) the results of a starship estimation
### Aliases: summary.starship print.starship
### Keywords: distribution

### ** Examples

data <- rgl(100,0,1,.2,.2)
starship.result <- starship(data,optim.method="Nelder-Mead",initgrid=list(lcvect=(0:4)/10,
ldvect=(0:4)/10))
print(starship.result)
summary(starship.result,estimation.details=TRUE)



