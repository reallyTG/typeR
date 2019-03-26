library(TPEA)


### Name: AUEC
### Title: Calculate the area under the cumulative enrichment curve (AUEC)
###   based on the interested gene set.
### Aliases: AUEC

### ** Examples

##Randomly generated interested genes
DEGs<-sample(100:100000,15)
DEG<-as.matrix(DEGs);
## The function is used to calculate the observed statistic
area<-AUEC(DEG);



