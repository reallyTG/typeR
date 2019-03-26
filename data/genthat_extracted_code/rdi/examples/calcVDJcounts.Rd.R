library(rdi)


### Name: calcVDJcounts
### Title: Calculate repertoire counts
### Aliases: calcVDJcounts

### ** Examples


#create genes
genes = sample(letters, 10000, replace=TRUE)

#create sequence annotations
seqAnnot = data.frame(donor = sample(1:4, 10000, replace=TRUE),
                      visit = sample(c("V1","V2","V3"), 10000, replace=TRUE),
                      cellType = sample(c("B","T"), 10000, replace=TRUE)
                     )
                     
##generate repertoire counts for all repertoires
cts = calcVDJcounts(genes,seqAnnot) 

##Only include visit 1
cts = calcVDJcounts(genes,seqAnnot, select=list(visit="V1"))


## Just T cell repertoires, combining visit 1 and 3 together, and dropping visit 2
cts = calcVDJcounts(genes,seqAnnot, 
                    select=list(cellType="T", visit=c("V1","V3")), 
                    combine=list(visit="V[13]")) 




