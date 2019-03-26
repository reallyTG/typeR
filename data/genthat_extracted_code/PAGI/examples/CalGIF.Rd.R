library(PAGI)


### Name: CalGIF
### Title: Calculate the global influence factor (GIF)
### Aliases: CalGIF
### Keywords: file

### ** Examples

## Not run: 
##D 
##D ###calculate the global influence factor (GIF) by using the random walk with restart (RWR) algorithm###
##D #example 1
##D #get example data
##D dataset<-getdataset()
##D class.labels<-getclass.labels()
##D 
##D #calculate the global influence factor (GIF)
##D GIFscore<-CalGIF(dataset,class.labels)
##D #print the top ten results to screen
##D GIFscore[rev(order(GIFscore))][1:10]
##D 
##D #Each element is the GIF score and whose name correspond to gene symbol in the gene expression data. 
##D #If the genes in gene expression data are not included in the global gene-gene network, their GIF 
##D #scores will be zero.
##D 
##D #example 2
##D #get example data
##D dataset<-read.table(paste(system.file(package="PAGI"),"/localdata/dataset.txt",sep=""),
##D       header=T,sep="\t","\"")
##D class.labels<-as.character(read.table(paste(system.file(package="PAGI"),
##D       "/localdata/class.labels.txt",sep=""),quote="\"", stringsAsFactors=FALSE)[1,])
##D 
##D #calculate the global influence factor (GIF)
##D GIFscore<-CalGIF(dataset,class.labels)
##D #print the top ten results to screen
##D GIFscore[rev(order(GIFscore))][1:10]
##D 
##D #Each element is the GIF score and whose name correspond to gene symbol in the gene expression data. 
##D #If the genes in gene expression data are not included in the global gene-gene network, their
##D # GIF scores will be zero.
##D 
## End(Not run)



