library(corrDNA)


### Name: assoc_ZiR.ZjR
### Title: Association between variable Z_{iR} and Z_{jR}.
### Aliases: assoc_ZiR.ZjR

### ** Examples

## No test: 
data(don_dat)
kk <- don_dat[1:300,]
zizj <- assoc_Zi.Zj(x=kk)
zizjr <- assoc_Zi.ZjR(x=kk, rZiZj=zizj)
zirzjr <- assoc_ZiR.ZjR(x=kk, rZiZj=zizj, rZiZjR=zizjr)
zirzjr
## End(No test)



