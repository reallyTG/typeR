library(smoothSurv)


### Name: give.c
### Title: Work Function for 'smoothSurvReg'
### Aliases: give.c
### Keywords: internal utilities

### ** Examples

knots <- seq(-4, 4, 0.5)
sd0 <- 0.3
ccoef <- find.c(knots, sd0, dist = "dstlogis")

last.three <- c(3, 7, 10)
c.rest <- ccoef[-last.three]
ccoef2 <- give.c(knots, sd0, last.three, c.rest)

print(ccoef)
print(ccoef2)    ## Almost no change



