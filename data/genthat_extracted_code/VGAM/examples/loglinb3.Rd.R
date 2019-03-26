library(VGAM)


### Name: loglinb3
### Title: Loglinear Model for Three Binary Responses
### Aliases: loglinb3
### Keywords: models regression

### ** Examples

lfit <- vglm(cbind(cyadea, beitaw, kniexc) ~ altitude, loglinb3,
             data = hunua, trace = TRUE)
coef(lfit, matrix = TRUE)
head(fitted(lfit))
summary(lfit)



