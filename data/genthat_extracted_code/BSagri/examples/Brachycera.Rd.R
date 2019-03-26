library(BSagri)


### Name: Brachycera
### Title: Eklektor counts of Brachycera
### Aliases: Brachycera
### Keywords: datasets

### ** Examples

data(Brachycera)

par(mar=c(11,5,3,1))

boxplot(Total ~ Treatment*Date, data=Brachycera, las=2, 
col=c("white","white","blue","green"))

legend(x=15, y=80, legend=levels(Brachycera$Treatment),
 fill=c("white","white","blue","green"))




