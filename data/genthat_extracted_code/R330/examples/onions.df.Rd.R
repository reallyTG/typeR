library(R330)


### Name: onions.df
### Title: Onion growing data
### Aliases: onions.df
### Keywords: datasets

### ** Examples

data(onions.df)
onions.glm<-glm(skins ~ factor(block),
      family=poisson, weight=weight, data=onions.df)




