library(R330)


### Name: births.df
### Title: Risk factors for low birthweight
### Aliases: births.df
### Keywords: datasets

### ** Examples

data(births.df)
births.lm<-lm(bwt~age*race*smoke*ui*ht+lwt*race*smoke*ui*ht,data=births.df)
anova(births.lm)




