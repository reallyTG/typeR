library(R330)


### Name: vaso.df
### Title: vaso-constriction data
### Aliases: vaso.df
### Keywords: datasets

### ** Examples

data(vaso.df)
plot(vaso.df$Rate,vaso.df$Volume,type="n", cex=1.2)
text(vaso.df$Rate,vaso.df$Volume,1:39,
col=ifelse(vaso.df$Response==1, "red","blue"),cex=1.2)
text(2.3,3.5,"blue: no VS", col="blue",adj=0, cex=1.2)
text(2.3,3.0,"red: VS", col="red", adj=0, cex=1.2)



