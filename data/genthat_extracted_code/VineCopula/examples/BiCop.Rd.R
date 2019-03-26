library(VineCopula)


### Name: BiCop
### Title: Constructing BiCop-objects
### Aliases: BiCop

### ** Examples


## create BiCop object for bivariate t-copula
obj <- BiCop(family = 2, par = 0.4, par2 = 6)
obj

## see the object's content or a summary
str(obj)
summary(obj)

## a selection of functions that can be used with BiCop objects
simdata <- BiCopSim(300, obj)  # simulate data
BiCopPDF(0.5, 0.5, obj) # evaluate density in (0.5,0.5)
plot(obj)  # surface plot of copula density
contour(obj)  # contour plot with standard normal margins
print(obj)  # brief overview of BiCop object
summary(obj)  # comprehensive overview of BiCop object




