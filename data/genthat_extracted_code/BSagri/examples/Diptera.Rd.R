library(BSagri)


### Name: Diptera
### Title: Soil eklektor data for some families of Diptera
### Aliases: Diptera
### Keywords: datasets

### ** Examples

data(Diptera)


layout(matrix(1:6, nrow=3))

boxplot(Callip~Treatment, data=Diptera, horizontal=TRUE, las=1,
 main="Abundanz Callip", col=c("white","white","blue","red"))

boxplot(Chloro~Treatment, data=Diptera, horizontal=TRUE, las=1,
 main="Abundanz Chloro", col=c("white","white","blue","red"))

boxplot(Ephyd~Treatment, data=Diptera, horizontal=TRUE, las=1,
 main="Abundanz Ephyd", col=c("white","white","blue","red"))

boxplot(Droso~Treatment, data=Diptera, horizontal=TRUE, las=1,
 main="Abundanz Droso", col=c("white","white","blue","red"))

boxplot(Chiro~Treatment, data=Diptera, horizontal=TRUE, las=1,
 main="Abundanz Chiro", col=c("white","white","blue","red"))

boxplot(Ges~Treatment, data=Diptera, horizontal=TRUE, las=1,
 main="Abundanz all Diptera", col=c("white","white","blue","red"))





