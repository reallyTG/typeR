library(VGAM)


### Name: micmen
### Title: Michaelis-Menten Model
### Aliases: micmen
### Keywords: models regression

### ** Examples

mfit <- vglm(velocity ~ 1, micmen, data = enzyme, trace = TRUE,
             crit = "coef", form2 = ~ conc - 1)
summary(mfit)

## Not run: 
##D  plot(velocity ~ conc, enzyme, xlab = "concentration", las = 1,
##D      col = "blue", main = "Michaelis-Menten equation for the enzyme data",
##D      ylim = c(0, max(velocity)), xlim = c(0, max(conc)))
##D points(fitted(mfit) ~ conc, enzyme, col = "red", pch = "+", cex = 1.5)
##D 
##D # This predicts the response at a finer grid:
##D newenzyme <- data.frame(conc = seq(0, max(with(enzyme, conc)), len = 200))
##D mfit@extra$Xm2 <- newenzyme$conc # This assignment is needed for prediction
##D lines(predict(mfit, newenzyme, "response") ~ conc, newenzyme, col = "red") 
## End(Not run)



