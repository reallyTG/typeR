library(R330)


### Name: rubber.df
### Title: Rubber Specimen Data
### Aliases: rubber.df
### Keywords: datasets

### ** Examples

data(rubber.df)
rubber.lm<-lm(abloss~hardness+tensile,data=rubber.df)
pred<-fitted.values(rubber.lm)
res<-residuals(rubber.lm)
plot(pred,res)



