library(corrDNA)


### Name: assoc_ZiR.ZjY
### Title: Association between variable Z_{iR} and Z_{jY}.
### Aliases: assoc_ZiR.ZjY

### ** Examples

## No test: 
data(don_dat)
kk <- don_dat[1:300,]
zizj <- assoc_Zi.Zj(x=kk)
zizjr <- assoc_Zi.ZjR(x=kk, rZiZj=zizj)
zizjy <- assoc_Zi.ZjY(x=kk, rZiZj=zizj)
zirzjy <- assoc_ZiR.ZjY(x=kk, rZiZj=zizj, rZiZjR=zizjr, rZiZjY=zizjy)
zirzjy
## End(No test)



