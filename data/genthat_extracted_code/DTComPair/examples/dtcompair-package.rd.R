library(DTComPair)


### Name: DTComPair-package
### Title: Comparison of Binary Diagnostic Tests in a Paired Study Design
### Aliases: DTComPair-package DTComPair
### Keywords: package

### ** Examples

data(Paired1) # Hypothetical study data 
hsd <- tab.paired(d=d, y1=y1, y2=y2, data=Paired1)
acc.paired(hsd)
sesp.mcnemar(hsd)
pv.rpv(hsd)
dlr.regtest(hsd)



