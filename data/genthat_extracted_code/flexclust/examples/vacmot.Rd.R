library(flexclust)


### Name: vacmot
### Title: Vacation Motives of Australians
### Aliases: vacmot vacmot6 vacmotdesc
### Keywords: datasets

### ** Examples

data(vacmot)
summary(vacmotdesc)
dotchart(sort(colMeans(vacmot)))

## reproduce Figure 6 from Dolnicar & Leisch (2008)
cl6 <- kcca(vacmot, k=vacmot6, control=list(iter=0))
barchart(cl6)



