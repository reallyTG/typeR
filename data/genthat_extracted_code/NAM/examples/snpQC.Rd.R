library(NAM)


### Name: SNP QC
### Title: SNP Quality Control
### Aliases: snpQC cleanREP reference

### ** Examples

data(tpod)
gen=reference(gen)
gen=snpQC(gen=gen,psy=1,MAF=0.05,remove=TRUE,impute=FALSE)
test=cleanREP(y,gen)



