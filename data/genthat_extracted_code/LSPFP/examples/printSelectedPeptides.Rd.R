library(LSPFP)


### Name: printSelectedPeptides
### Title: Only print peptides
### Aliases: printSelectedPeptides
### Keywords: ~kwd1 ~kwd2

### ** Examples


## Not run: 
##D #To run this example you need to run the example from wrapperLSPFP
##D 
##D path <- paste0(getwd(),"/AnalysisData/Test_Mouse")
##D test <- read.csv(paste0(path, "/feature_table.csv"))
##D 
##D 
##D #Rows can be deleted or sorted but columns should not be removed
##D #Print the first 25 rows
##D myprint <- test[1:25,]
##D #Sort by accession
##D myprint2 <- test[sort(test$Accession), ]
##D 
##D printSelectedPeptides(path, "newfeaturetable", mysorteddf = myprint)
##D 
## End(Not run)




