library(snplist)


### Name: snplist-package
### Title: Tools to Create Gene Sets
### Aliases: snplist-package snplist
### Keywords: package

### ** Examples

chromosome <- c(1,5,22,"X","Y","MT")

geneNum <- 5
snpNum <- 1200
annoDataNum <- 500

chrLength <- 1000
geneLength <- 100

gene <- paste("gene",1:geneNum,sep="")
chr <- sample(chromosome,geneNum,replace=TRUE)
start <- sample(chrLength,geneNum,replace=TRUE)
d <- sample(geneLength,geneNum,replace=TRUE)
end <- start+d
geneInfo <- data.frame(gene,chr,start,end)

rsid <- paste("rs",1:snpNum,sep="")
chr <- sample(chromosome,snpNum,replace=TRUE)
pos <- sample(chrLength+geneLength,snpNum,replace=TRUE)
snpInfo <- data.frame(rsid,chr,pos)

annoInfo <- data.frame("rsid"=sample(rsid,annoDataNum))

dim(geneInfo)
dim(snpInfo)
dim(annoInfo)

setGeneTable(geneInfo)
setSNPTable(snpInfo)
geneset <- makeGeneSet(annoInfo)
exportPLINKSet(geneset,"geneSet.set")
file.show("geneSet.set")



