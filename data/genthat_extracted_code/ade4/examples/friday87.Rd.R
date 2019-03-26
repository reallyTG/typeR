library(ade4)


### Name: friday87
### Title: Faunistic K-tables
### Aliases: friday87
### Keywords: datasets

### ** Examples

data(friday87)
wfri <- data.frame(scale(friday87$fau, scal = FALSE))
wfri <- ktab.data.frame(wfri, friday87$fau.blo, 
    tabnames = friday87$tab.names)

if(adegraphicsLoaded()) {    
  g1 <- kplot(sepan(wfri), row.plabels.cex = 2)
} else {
  kplot(sepan(wfri), clab.r = 2, clab.c = 1)
}



