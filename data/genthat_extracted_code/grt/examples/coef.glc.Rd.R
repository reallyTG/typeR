library(grt)


### Name: coef.glc
### Title: Extract 'glc' or 'gcjc' coefficients
### Aliases: coef.glc coef.glcStruct coef.gcjc
### Keywords: models

### ** Examples

data(subjdemo_2d)
fit.2dl <- glc(response ~ x + y, data=subjdemo_2d,
    category=subjdemo_2d$category, zlimit=7)
plot(fit.2dl, fitdb=FALSE)
abline(coef(fit.2dl), col = "red")
abline(coef(fit.2dl$initpar))

fit.1dx <- update(fit.2dl, . ~ . -y)
abline(v=coef(fit.1dx), col="green")

fit.1dy <- update(fit.2dl, . ~ . -x)
abline(h=coef(fit.1dy), col="blue")



