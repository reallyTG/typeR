library(R330)


### Name: chickwts.df
### Title: Chicken Weights Data
### Aliases: chickwts.df
### Keywords: datasets

### ** Examples

data(chickwts.df)
model1<-lm(chickweight~protein*protlevel*fish, data=chickwts.df)
summary(model1)




