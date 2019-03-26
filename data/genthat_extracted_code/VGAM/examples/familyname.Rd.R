library(VGAM)


### Name: familyname
### Title: Family Function Name
### Aliases: familyname familyname.vlm familyname.vglmff
### Keywords: models regression

### ** Examples

pneumo <- transform(pneumo, let = log(exposure.time))
fit1 <- vglm(cbind(normal, mild, severe) ~ let,
              cumulative(parallel = TRUE, reverse = TRUE), data = pneumo)
familyname(fit1)
familyname(fit1, all = TRUE)
familyname(propodds())  # "cumulative"



