library(protViz)


### Name: genMod
### Title: Generates all possible modification of a given peptide seqence
###   and modification pattern
### Aliases: genMod

### ** Examples

    ptm.0<-cbind(AA="-",
        mono=0.0, avg=0.0, desc="unmodified", unimodAccID=NA)

    ptm.616<-cbind(AA='S',
        mono=-27.010899, avg=NA, desc="Substituition",
            unimodAccID=616)

    ptm.651<-cbind(AA='N',
        mono=27.010899, avg=NA, desc="Substituition",
            unimodAccID=651)


    m<-as.data.frame(rbind(ptm.0, ptm.616, ptm.651))

    genMod(c('TAFDEAIAELDTLNEESYK','TAFDEAIAELDTLSEESYK'), m$AA)




