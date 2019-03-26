library(ade4)


### Name: ktab.data.frame
### Title: Creation of K-tables from a data frame
### Aliases: ktab.data.frame
### Keywords: multivariate

### ** Examples

data(escopage)
wescopage <- data.frame(scalewt(escopage$tab))
wescopage <- ktab.data.frame(wescopage, escopage$blo,
        tabnames = escopage$tab.names)
plot(sepan(wescopage))
data(friday87)
w <- data.frame(scale(friday87$fau, scal = FALSE))
w <- ktab.data.frame(w, friday87$fau.blo, tabnames = friday87$tab.names)
kplot(sepan(w))



