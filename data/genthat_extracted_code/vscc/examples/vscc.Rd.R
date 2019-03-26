library(vscc)


### Name: vscc
### Title: Variable selection for clustering and classification
### Aliases: vscc
### Keywords: ~kwd1 ~kwd2

### ** Examples

require("mclust")
data(banknote) #Load data
head(banknote[,-1]) #Show preview of full data set
bankrun <- vscc(banknote[,-1])
head(bankrun$topselected) #Show preview of selected variables
table(banknote[,1], bankrun$initialrun$classification) #Clustering results on full data set
table(banknote[,1], bankrun$bestmodel$classification) #Clustering results on reduced data set



