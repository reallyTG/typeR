library(epiDisplay)


### Name: Ectopic pregnancy
### Title: Dataset of a case-control study looking at history of abortion
###   as a risk factor for ectopic pregnancy
### Aliases: Ectopic
### Keywords: datasets

### ** Examples
data(Ectopic)
library(nnet)
data(Ectopic)
.data <- Ectopic
multi1 <- multinom(outc ~ hia + gravi, data=.data)
summary(multi1)
mlogit.display(multi1)

# Changing referent group of outcome
.data$outcIA <- relevel(.data$outc, ref="IA")
multi2 <- multinom(outcIA ~ hia + gravi, data=.data)
summary(multi2)
mlogit.display(multi2)



