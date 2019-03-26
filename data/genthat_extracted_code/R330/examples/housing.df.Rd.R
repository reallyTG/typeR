library(R330)


### Name: housing.df
### Title: Housing conditions satisfaction
### Aliases: housing.df
### Keywords: datasets

### ** Examples

data(housing.df)
housing.glm<-glm(count~sat*infl*cont, family=poisson, data=housing.df)
anova(housing.glm, test="Chisq")




