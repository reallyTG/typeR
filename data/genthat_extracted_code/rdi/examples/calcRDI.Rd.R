library(rdi)


### Name: calcRDI
### Title: Calculate repertoire distances
### Aliases: calcRDI

### ** Examples


#create genes
genes = sample(letters, 10000, replace=TRUE)

#create sequence annotations
seqAnnot = data.frame(donor = sample(1:4, 10000, replace=TRUE),
                      cellType = sample(c("B","T"), 10000, replace=TRUE)
                     )
##generate repertoire counts
cts = calcVDJcounts(genes,seqAnnot) 

##calculate RDI 
d = calcRDI(cts)

##calculate RDI in percent space
d_pct = calcRDI(cts,units="pct")

##convert RDI to actual 'lfc' estimates and compare
dtrue = convertRDI(d)$pred
plot(d, dtrue)




