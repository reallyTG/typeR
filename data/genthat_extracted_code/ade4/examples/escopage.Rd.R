library(ade4)


### Name: escopage
### Title: K-tables of wine-tasting
### Aliases: escopage
### Keywords: datasets

### ** Examples

data(escopage)
w <- data.frame(scale(escopage$tab))
w <- ktab.data.frame(w, escopage$blo)
names(w)[1:4] <- escopage$tab.names
plot(mfa(w, scan = FALSE))



