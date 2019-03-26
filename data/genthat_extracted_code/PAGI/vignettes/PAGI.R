### R code from vignette source 'PAGI.Rnw'

###################################################
### code chunk number 1: PAGI.Rnw:46-47
###################################################
library(PAGI)


###################################################
### code chunk number 2: PAGI.Rnw:60-78
###################################################
#example 1
#get example data
dataset<-getdataset()
class.labels<-getclass.labels()
#calculate the global influence factor (GIF)
GIFscore<-CalGIF(dataset,class.labels)
#print the top ten results to screen
GIFscore[rev(order(GIFscore))][1:10]
#example 2
#get example data
dataset<-read.table(paste(system.file(package="PAGI"),"/localdata/dataset.txt",sep=""),
header=T,sep="\t",quote="\"")
class.labels<-as.character(read.table(paste(system.file(package="PAGI"),
"/localdata/class.labels.txt",sep=""),quote="\"", stringsAsFactors=FALSE)[1,])
#calculate the global influence factor (GIF)
GIFscore<-CalGIF(dataset,class.labels)
#print the top ten results to screen
GIFscore[rev(order(GIFscore))][1:10]


###################################################
### code chunk number 3: PAGI.Rnw:86-126
###################################################
#example 1
#get example data
dataset<-getdataset()
class.labels<-getclass.labels()
#identify dysregulated pathways
result<-PAGI.Main(dataset,class.labels,nperm = 100,p.val.threshold = -1,FDR.threshold = 0.01,
gs.size.threshold.min = 25, gs.size.threshold.max = 500 )
#print the summary results of top ten pathways to screen
result[[1]][1:10,]
#print the detail results of top ten genes in the first pathway to screen
result[[2]][[1]][1:10,]
#write the summary results of pathways to tab delimited file. 
write.table(result[[1]], file = "SUMMARY RESULTS.txt", quote=F, row.names=F, sep = "\t")
#write the detail results of genes for each pathway with FDR.threshold< 0.01 to tab delimited file. 
for(i in 1:length(result[[2]])){
gene.report<-result[[2]][[i]]
filename <- paste(names(result[[2]][i]),".txt", sep="", collapse="")
write.table(gene.report, file = filename, quote=F, row.names=F, sep = "\t")
}
#example 2
#get example data
dataset<-read.table(paste(system.file(package="PAGI"),"/localdata/dataset.txt",sep=""),
header=T,sep="\t",quote="\"")
class.labels<-as.character(read.table(paste(system.file(package="PAGI"),
"/localdata/class.labels.txt",sep=""),quote="\"", stringsAsFactors=FALSE)[1,])
#identify dysregulated pathways
result<-PAGI.Main(dataset,class.labels,nperm = 100,p.val.threshold = -1,FDR.threshold = 0.01,
gs.size.threshold.min = 25, gs.size.threshold.max = 500 )
#print the summary results of top ten pathways to screen
result[[1]][1:10,]
#print the detail results of top ten genes in the first pathway to screen
result[[2]][[1]][1:10,]
#write the summary results of pathways to tab delimited file. 
write.table(result[[1]], file = "SUMMARY RESULTS.txt", quote=F, row.names=F, sep = "\t")
#write the detail results of genes for each pathway with FDR.threshold< 0.01 to tab delimited file. 
for(i in 1:length(result[[2]])){
gene.report<-result[[2]][[i]]
filename <- paste(names(result[[2]][i]),".txt", sep="", collapse="")
write.table(gene.report, file = filename, quote=F, row.names=F, sep = "\t")
}


###################################################
### code chunk number 4: sessionInfo
###################################################
sessionInfo()


