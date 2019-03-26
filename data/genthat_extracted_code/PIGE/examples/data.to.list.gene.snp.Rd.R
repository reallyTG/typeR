library(PIGE)


### Name: data.to.list.gene.snp
### Title: Annotation gene/SNP
### Aliases: data.to.list.gene.snp

### ** Examples

##Example : case-control study data
data(data.pige)
data(data.pathway)
path.in <- paste(system.file("sampleData", package="PIGE"),"/",sep="")
file <- "SNP-GENE-annotation.txt"
list.gene.snp <- data.to.list.gene.snp(file,path=path.in)
##Example Survival data
data("data.surv")
data("data.pathway.surv")
path.in <- paste(system.file("sampleData", package="PIGE"),"/",sep="")
file="snp.gene.surv.txt"
list.gene.snp.surv <- data.to.list.gene.snp(file,path=path.in)



