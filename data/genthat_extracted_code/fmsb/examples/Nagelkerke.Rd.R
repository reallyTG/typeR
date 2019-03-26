library(fmsb)


### Name: NagelkerkeR2
### Title: Calculate Nagelkerke's R squared.
### Aliases: NagelkerkeR2

### ** Examples

 res <- glm(cbind(ncases,ncontrols) ~ agegp+alcgp+tobgp, data=esoph, family=binomial())
 summary(res)
 NagelkerkeR2(res)



