library(profileModel)


### Name: print.profileModel
### Title: Printing 'profileModel' objects
### Aliases: print.profileModel
### Keywords: print

### ** Examples

## Begin Example
y <- c(1,1,0,0)
x1 <- c(1,0,1,0)
x2 <- c(1,1,0,0)
prof1 <- profileModel(glm(y ~ x1 + x2, family = binomial),
                      objective = "ordinaryDeviance",
                      grid.bounds = rep(c(-1,1),3))
print(prof1)
prof2 <- update(prof1, quantile = qchisq(0.95,1), grid.bounds=NULL)
print(prof2, print.fit = TRUE)
## End Example



