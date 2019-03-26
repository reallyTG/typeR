library(BSDA)


### Name: Dealers
### Title: Automobile dealers classified according to type dealership and
###   service rendered to customers
### Aliases: Dealers
### Keywords: datasets

### ** Examples


xtabs(~type + service, data = Dealers)
T1 <- xtabs(~type + service, data = Dealers)
T1
addmargins(T1)
pt <- prop.table(T1, margin = 1)
pt
barplot(t(pt),  col = c("red", "skyblue"), legend = colnames(T1))
rm(T1, pt)




