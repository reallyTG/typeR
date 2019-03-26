library(urca)


### Name: ur.za
### Title: Zivot & Andrews Unit Root Test
### Aliases: ur.za
### Keywords: regression

### ** Examples

data(nporg)
gnp <- na.omit(nporg[, "gnp.r"])
za.gnp <- ur.za(gnp, model="both", lag=2)
summary(za.gnp)



