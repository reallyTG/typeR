library(VGAM)


### Name: predictqrrvglm
### Title: Predict Method for a CQO fit
### Aliases: predictqrrvglm
### Keywords: models regression

### ** Examples

## Not run: 
##D  set.seed(1234)
##D hspider[, 1:6] <- scale(hspider[, 1:6])  # Standardize the X vars
##D p1 <- cqo(cbind(Alopacce, Alopcune, Alopfabr, Arctlute,
##D                 Arctperi, Auloalbi, Pardlugu, Pardmont,
##D                 Pardnigr, Pardpull, Trocterr, Zoraspin) ~
##D           WaterCon + BareSand + FallTwig + CoveMoss + CoveHerb + ReflLux,
##D           poissonff, data = hspider, Crow1positive = FALSE, I.toler = TRUE)
##D sort(deviance(p1, history = TRUE))  # A history of all the iterations
##D head(predict(p1))
##D 
##D # The following should be all 0s:
##D max(abs(predict(p1, newdata = head(hspider)) - head(predict(p1))))
##D max(abs(predict(p1, newdata = head(hspider), type = "res")-head(fitted(p1))))
## End(Not run)



