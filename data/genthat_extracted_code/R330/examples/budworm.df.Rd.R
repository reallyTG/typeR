library(R330)


### Name: budworm.df
### Title: Budworm data
### Aliases: budworm.df
### Keywords: datasets

### ** Examples

data(budworm.df)
bugs.glm<-glm(s/n~sex+dose,family=binomial,weights=n,data=budworm.df)
summary(bugs.glm)



