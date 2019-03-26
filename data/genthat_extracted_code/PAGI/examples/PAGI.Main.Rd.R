library(PAGI)


### Name: PAGI.Main
### Title: A novel pathway identification approach based on global
###   influence from both the internal effect of pathways and crosstalk
###   between pathways
### Aliases: PAGI.Main
### Keywords: file

### ** Examples

## Not run: 
##D 
##D ##########identify dysregulated pathways by using the function PAGI.Main###########
##D #example 1
##D #get example data
##D dataset<-getdataset()
##D class.labels<-getclass.labels()
##D 
##D #identify dysregulated pathways
##D result<-PAGI.Main(dataset,class.labels,nperm = 100,p.val.threshold = -1,FDR.threshold = 0.01,
##D gs.size.threshold.min = 25, gs.size.threshold.max = 500 )
##D 
##D #print the summary results of pathways to screen
##D result[[1]][1:10,]
##D 
##D #The result is a dataframe. The rows of the dataframe are ranked by the values of False 
##D #discovery rate (FDR). Each row of the result (dataframe) is a pathway. It columns include 
##D #"Pathway Name", "SIZE", "PathwayID", "Pathway Score",  "NOM p-val", "FDR q-val", "Tag 
##D #percentage", "Gene percentage", "Signal strength". They correspond to pathway names, 
##D #the number of genes which were mapped to the pathway from gene expression profiles, pathway ID,
##D #the scores of pathway, the nominal p-values of the pathways, the FDR values, the percent of
##D #gene set before running enrichment peak, the percent of gene list before running enrichment peak,
##D #enrichment signal strength.
##D 
##D #print the detail results of pathways to screen
##D result[[2]][1:5]
##D 
##D #The result is a list. Each element of the list is a dataframe whcih present the detail results of
##D #genes in the pathway with FDR.threshold< 0.01. Each rows of the dataframe represents a gene.
##D #Its columns include "Gene number in the (sorted) pathway", "gene symbol from the gene express data",
##D #"location of the gene in the sorted gene list", "the T-score of gene between two biological states",
##D #"global influence impactor", "if the gene contribute to the score of pathway".
##D 
##D #write the summary results of pathways to tab delimited file. 
##D write.table(result[[1]], file = "SUMMARY RESULTS.txt", quote=F, row.names=F, sep = "\t")
##D 
##D #write the detail results of genes for each pathway with FDR.threshold< 0.01 to tab delimited file. 
##D for(i in 1:length(result[[2]])){
##D gene.report<-result[[2]][[i]]
##D filename <- paste(names(result[[2]][i]),".txt", sep="", collapse="")
##D write.table(gene.report, file = filename, quote=F, row.names=F, sep = "\t")
##D }
##D 
##D #example 2
##D #get example data
##D dataset<-read.table(paste(system.file(package="PAGI"),"/localdata/dataset.txt",sep=""),
##D header=T,sep="\t","\"")
##D class.labels<-as.character(read.table(paste(system.file(package="PAGI"),
##D "/localdata/class.labels.txt",sep=""),quote="\"", stringsAsFactors=FALSE)[1,])
##D 
##D #identify dysregulated pathways
##D result<-PAGI.Main(dataset,class.labels,nperm = 100,p.val.threshold = -1,FDR.threshold = 0.01,
##D gs.size.threshold.min = 25, gs.size.threshold.max = 500 )
##D 
##D #print the summary results of pathways to screen
##D result[[1]][1:10,]
##D 
##D #The result is a dataframe. The rows of the dataframe are ranked by the values of False 
##D #discovery rate (FDR). Each row of the result (dataframe) is a pathway. It columns include 
##D #"Pathway Name", "SIZE", "PathwayID", "Pathway Score",  "NOM p-val", "FDR q-val", "Tag 
##D #percentage", "Gene percentage", "Signal strength". They correspond to pathway names, 
##D #the number of genes which were mapped to the pathway from gene expression profiles, pathway ID,
##D #the scores of pathway, the nominal p-values of the pathways, the FDR values, the percent of
##D #gene set before running enrichment peak, the percent of gene list before running enrichment peak,
##D #enrichment signal strength.
##D 
##D #print the detail results of pathways to screen
##D result[[2]][1:5]
##D 
##D #The result is a list. Each element of the list is a dataframe whcih present the detail results of
##D #genes in the pathway with FDR.threshold< 0.01. Each rows of the dataframe represents a gene.
##D #Its columns include "Gene number in the (sorted) pathway", "gene symbol from the gene express data",
##D #"location of the gene in the sorted gene list", "the T-score of gene between two biological states",
##D #"global influence impactor", "if the gene contribute to the score of pathway".
##D 
##D #write the summary results of pathways to tab delimited file. 
##D write.table(result[[1]], file = "SUMMARY RESULTS.txt", quote=F, row.names=F, sep = "\t")
##D 
##D #write the detail results of genes for each pathway with FDR.threshold< 0.01 to tab delimited file. 
##D for(i in 1:length(result[[2]])){
##D gene.report<-result[[2]][[i]]
##D filename <- paste(names(result[[2]][i]),".txt", sep="", collapse="")
##D write.table(gene.report, file = filename, quote=F, row.names=F, sep = "\t")
##D }
##D 
## End(Not run)



