library(simboot)


### Name: predatGM
### Title: Abundance data of predatory insects
### Aliases: predatGM
### Keywords: datasets

### ** Examples

data(predatGM)

str(predatGM)

# Display data as a mosaicplot

# load("D:/Mueller/Biodiv/data/predatGM.rda")

# Matrix of counts with appropriate names
COUNTS<-as.matrix(predatGM[,3:35])
SPECNAM<-names(predatGM)[3:35]
colnames(COUNTS)<-SPECNAM
rownames(COUNTS)<-predatGM[,"Variety"]

# Assign colors and order by decreasing total abundance
COL<-grey(c(0,2,4,6,8,1,3,5,7)/8)
DMO<-COUNTS[,order(colSums(COUNTS), decreasing=TRUE)]
colnames(DMO)[15:33]<-"."

# Mosaicplot
par(mar=c(4,2,1,1))
mosaicplot(DMO, col=COL, las=2, off=15, main="", cex=1.1)
mtext("A", side=3, line=-1.5, adj=0, cex=2)





