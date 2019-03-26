library(R330)


### Name: ingots.df
### Title: Unreadiness for rolling of metal ingots
### Aliases: ingots.df
### Keywords: datasets

### ** Examples

data(ingots.df)
ingots.glm<-glm(cbind(notready, total-notready)~heat + 
   soak, weight=total, family = binomial, data = ingots.df)
summary(ingots.glm)



