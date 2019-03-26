library(preputils)


### Name: fillmap
### Title: Supplement missing values in mapping of data
### Aliases: fillmap

### ** Examples

    library(data.table)
    pheno1 <- data.frame(id1=c(1,2,3,4),id2=c(11,22,NA,NA),phenodat=c(NA,NA,NA,"d"))
    pheno2 <- data.frame(id1=c(NA,NA,NA),id2=c(11,22,33),phenodat=c("a","b","c"))
    pheno3 <- data.frame(id1=c(4,3),id2=c(44,33),phenodat=c(NA,NA))
    phenoges <- rbind(rbind(pheno1,pheno2),pheno3)
    with(phenoges,fillmap(id1,phenodat))
    with(phenoges,fillmap(id1,phenodat,rmdup=TRUE))
    with(phenoges,fillmap(id1,phenodat,rmmiss=TRUE))
    with(phenoges,fillmap(id1,phenodat,rmdup=TRUE,rmmiss=TRUE))
    with(phenoges,fillmap(id2,phenodat))
    with(phenoges,fillmap(id2,phenodat,rmdup=TRUE))
    with(phenoges,fillmap(id2,phenodat,rmmiss=TRUE))
    with(phenoges,fillmap(id2,phenodat,rmdup=TRUE,rmmiss=TRUE))
    phenosupp <- with(phenoges,fillmap(id1,id2))
    names(phenosupp) <- c("id1","id2")
    phenosupp$phenodat <- fillmap(phenosupp$id1,phenoges$phenodat,what="y")
    unique(phenosupp)



