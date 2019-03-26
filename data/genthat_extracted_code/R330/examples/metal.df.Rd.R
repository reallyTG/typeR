library(R330)


### Name: metal.df
### Title: Metal Removal
### Aliases: metal.df
### Keywords: datasets

### ** Examples

data(metal.df)
med <-ifelse(metal.df$setting=="medium", 1,0)
slow<-ifelse(metal.df$setting=="slow", 1,0)
summary(lm(rate~med + slow + hardness, data=metal.df))




