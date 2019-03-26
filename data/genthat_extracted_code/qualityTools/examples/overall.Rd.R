library(qualityTools)


### Name: overall
### Title: Overall Desirability
### Aliases: overall

### ** Examples

#arbitrary example with random data!!!
rsdo = rsmDesign(k = 2, blocks = 2, alpha = "both")
set.seed(123)
response(rsdo) = data.frame(y = rnorm(nrow(rsdo)), y2 = rnorm(nrow(rsdo)))
fits(rsdo) = lm(y ~ A*B + I(A^2) + I(B^2), data = rsdo)
fits(rsdo) = lm(y2 ~ A*B + I(A^2) + I(B^2), data = rsdo)
desires(rsdo) = desirability(y, -1, 2, scale = c(1, 1), target = "max")
desires(rsdo) = desirability(y2, -1, 0, scale = c(1, 1), target = "min")
dVals = overall(rsdo, steps = 10, constraints = list(A = c(-0.5,1), 
                B = c(0, 1)))

##Uncomment for visualization of desirabilities
#require(lattice)
#contourplot(y ~ A*B,  data = dVals) #desirability of y
#contourplot(y2 ~ A*B,  data = dVals) #desirability of y2
#wireframe(overall ~ A*B, shade = TRUE, data = dVals)



