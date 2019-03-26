library(kequate)


### Name: FTres
### Title: Freeman-Tukey Residuals
### Aliases: FTres

### ** Examples

#Example data:
P<-c(5, 20, 35, 25, 15)
x<-0:4
glmx<-glm(P~I(x)+I(x^2), family="poisson", x=TRUE)
res<-FTres(glmx$y, glmx$fitted.values)



