library(anchors)


### Name: anchors
### Title: Non-parametric analysis of surveys with vignette anchors
### Aliases: anchors anchors.rank
### Keywords: models

### ** Examples

data(mexchn)

fo <- list(self = xsayself ~ age,
           vign = cbind(xsay3,xsay1)    ~ 1,
           tau  = ~ age + china,
           tau1 = ~ age + china + male,
           cpolr= ~ china + male
    )

a2 <- anchors(fo, data = mexchn, method="B")
summary(a2)

a3 <- anchors(fo, data = mexchn, method="C")
summary(a3)





