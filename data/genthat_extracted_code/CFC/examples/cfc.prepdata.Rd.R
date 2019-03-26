library(CFC)


### Name: cfc.prepdata
### Title: Utility function for CFC data preparation
### Aliases: cfc.prepdata

### ** Examples

data(bmt)
prep.out <- cfc.prepdata(Surv(time, cause) ~ platelet + age + tcell, bmt)



