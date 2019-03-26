library(MiRSEA)


### Name: MirSEA
### Title: Identify dysregulated pathways based on microRNA (miRNA) set
###   enrichment analysis
### Aliases: MirSEA
### Keywords: file

### ** Examples

## Not run: 
##D #get example of expression data
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
##D #identify dysregulated pathways by using the function MirSEA
##D MirSEAresult <- MirSEA(input.ds,input.cls,p_value,p2miR,
##D reshuffling.type = "miR.labels", nperm = 1000, 
##D weighted.score.type = 1, ms.size.threshold.min = 10, 
##D ms.size.threshold.max = 500)
##D #print the summary results of pathways to screen
##D  
##D summaryResult1 <- MirSEAresult$report.phen1
##D summaryResult1[1:5,]
##D summaryResult2 <- MirSEAresult$report.phen2
##D summaryResult2[1:5,]
##D  
##D #write the summary results of pathways to tab delimited file.
##D write.table(summaryResult1,file="summaryResult1.txt",sep="\t",row.names=FALSE)
##D 
##D write.table(summaryResult2,file="summaryResult2.txt",sep="\t",row.names=FALSE)
## End(Not run)



