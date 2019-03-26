library(revengc)


### Name: seedmatrix
### Title: An uncensored seed matrix from censored contingency table
### Aliases: seedmatrix

### ** Examples

# create a censored contingency table
contingencytable<-matrix(1:9, 
                         nrow = 3, ncol = 3)
rowmarginal<-apply(contingencytable,1,sum)
contingencytable<-cbind(contingencytable, rowmarginal)
colmarginal<-apply(contingencytable,2,sum)
contingencytable<-rbind(contingencytable, colmarginal)
row.names(contingencytable)[row.names(contingencytable)=="colmarginal"]<-""
contingencytable<-data.frame(c("<5", "5I9", ">9", NA), contingencytable)
colnames(contingencytable)<-c(NA,"<=19","20-30",">=31", NA)

# look at the seed for this example (probabilities)
seed.output<-seedmatrix(contingencytable, 1, 
                        15, 15, 35)$Probabilities




