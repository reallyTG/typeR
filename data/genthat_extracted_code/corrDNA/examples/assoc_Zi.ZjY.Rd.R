library(corrDNA)


### Name: assoc_Zi.ZjY
### Title: Association between variable Z_{i} and Z_{jY}.
### Aliases: assoc_Zi.ZjY

### ** Examples

data(don_dat)
kk <- don_dat[1:300,]
zizj <- assoc_Zi.Zj(x=kk)
zizjy <- assoc_Zi.ZjY(x=kk, rZiZj=zizj)
zizjy



