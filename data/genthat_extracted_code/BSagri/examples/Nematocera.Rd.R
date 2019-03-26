library(BSagri)


### Name: Nematocera
### Title: Trap counts of Nematocera
### Aliases: Nematocera
### Keywords: datasets

### ** Examples

data(Nematocera)

par(mar=c(11,5,3,1))

boxplot(Total ~ Treatment*Date, data=Nematocera, las=2, col=c("white","white","blue","green"))
legend(x=15, y=100, legend=levels(Nematocera$Treatment), fill=c("white","white","blue","green"))

pairs(Nematocera[,c("Cecido","Cerato","Chiro","Myceto","Psycho","Sciari")])




