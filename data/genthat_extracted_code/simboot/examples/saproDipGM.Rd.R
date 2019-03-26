library(simboot)


### Name: saproDipGM
### Title: Abundance data of Diptera with saprophagous larvae
### Aliases: saproDipGM
### Keywords: datasets

### ** Examples

data(saproDipGM)

str(saproDipGM)

# load("D:/Mueller/Biodiv/data/saproDipGM.rda")

# Display data as a mosaicplot

# Matrix of counts with appropriate names
COUNTS<-as.matrix(saproDipGM[,3:27])
SPECNAM<-names(saproDipGM)[3:27]
colnames(COUNTS)<-SPECNAM
rownames(COUNTS)<-saproDipGM[,"Variety"]

# Assign colors and order by decreasing total abundance
COL<-grey(c(0,2,4,6,8,1,3,5,7)/8)
DMO<-COUNTS[,order(colSums(COUNTS), decreasing=TRUE)]

# Mosaicplot
par(mar=c(4,2,1,1))
mosaicplot(DMO, col=COL, las=2, off=15, main="", cex=1.1)
mtext("A", side=3, line=-1.5, adj=0, cex=2)




