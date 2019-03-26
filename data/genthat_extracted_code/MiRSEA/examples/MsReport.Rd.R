library(MiRSEA)


### Name: MsReport
### Title: Produce report for a microRNA (abbreviated miRNA) set
### Aliases: MsReport
### Keywords: file

### ** Examples

## Not run: 
##D #get example data
##D #input.ds <- readLines("F:/lsy/xin data/GSE36915.gct")
##D #input.cls <- readLines("F:/lsy/xin data/GSE36915.cls")
##D input.ds <- GetExampleData("dataset")
##D input.cls <- GetExampleData("class.labels")
##D  
##D #get example of p value matrix
##D p_value <- GetExampleData("p_value")
##D #get example of correlation profile
##D p2miR <- GetExampleData("p2miR")
##D 
##D #get a miRNA.SET report for KEGG ERBB PATHWAY
##D Results<-MsReport(MsNAME = "KEGG_ERBB_SIGNALING_PATHWAY", input.ds, input.cls,p_value,p2miR)
##D # show the report of top five miRNA in the pathway
##D Results[[1]][1:5,]
## End(Not run)



