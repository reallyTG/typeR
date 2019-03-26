library(R330)


### Name: cherry.df
### Title: Girth, Height and Volume for Black Cherry Trees
### Aliases: cherry.df
### Keywords: datasets

### ** Examples

data(cherry.df)
cherry.lm =lm(volume~diameter+height,data=cherry.df) 
new.df = data.frame(diameter=c(11,12),
             height=c(85,90))
predict(cherry.lm,new.df)




