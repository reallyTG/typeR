library(RSAlgaeR)


### Name: apply.mod.seasonal
### Title: apply.mod.seasonal
### Aliases: apply.mod.seasonal

### ** Examples

data(srdataforapplication)
data(utahsummermod)
estdata <- apply.mod.seasonal(df=srdataforapplication,
datecol="ImageDate",model=utahsummermod,season=c("July","August","September"),threshold=500)



