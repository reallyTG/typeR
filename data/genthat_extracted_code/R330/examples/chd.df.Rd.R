library(R330)


### Name: chd.df
### Title: Coronary heart disease data
### Aliases: chd.df
### Keywords: datasets

### ** Examples

data(chd.df)
chd.glm<-glm(chd~age,family=binomial,data=chd.df)
summary(chd.glm)



