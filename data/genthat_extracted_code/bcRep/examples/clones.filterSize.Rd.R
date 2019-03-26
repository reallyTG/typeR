library(bcRep)


### Name: clones.filterSize
### Title: Filter clones for their size
### Aliases: clones.filterSize

### ** Examples

data(clones.ind)

clones.filtered1<-clones.filterSize(clones.tab=clones.ind, 
     column="total_number_of_sequences", number=20, method="two.tailed")
clones.filtered2<-clones.filterSize(clones.tab=clones.ind, column=4, propOfClones=0.1, 
     method="upper.tail")
clones.filtered3<-clones.filterSize(clones.tab=clones.ind, column=4, 
     propOfSequences=0.02, method="lower.tail")



