library(corrDNA)


### Name: assoc_ZiY.ZjY
### Title: Association between variable Z_{iY} and Z_{jY}.
### Aliases: assoc_ZiY.ZjY

### ** Examples

## No test: 
data(don_dat)
kk <- don_dat[1:300,]
zizj <- assoc_Zi.Zj(x=kk)
zizjy <- assoc_Zi.ZjY(x=kk, rZiZj=zizj)
ziyzjy <- assoc_ZiY.ZjY(x=kk, rZiZj=zizj, rZiZjY=zizjy)
ziyzjy
## End(No test)



