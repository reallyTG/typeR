library(lomb)


### Name: lsp
### Title: Lomb-Scargle Periodogram
### Aliases: lsp
### Keywords: ts

### ** Examples


# ibex contains an unevenly sampled time series
data(ibex)
lsp(ibex[2:3],)
lsp(ibex$temp,times=ibex$hours,type='period',ofac=5)

# lynx contains evenly sampled data
lsp(lynx)
lynx.spec <- lsp(lynx,type='period',from=2,to=20,ofac=5)
summary(lynx.spec)



