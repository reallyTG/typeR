library(R330)


### Name: mines.df
### Title: Mining accident data
### Aliases: mines.df
### Keywords: datasets

### ** Examples

data(mines.df)
mines.glm<-glm(COUNT ~ INB + EXTRP + AHS + AGE, 
                family=poisson, data=mines.df)




