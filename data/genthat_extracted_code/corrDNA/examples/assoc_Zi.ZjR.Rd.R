library(corrDNA)


### Name: assoc_Zi.ZjR
### Title: Association between variable Z_{i} and Z_{jR}.
### Aliases: assoc_Zi.ZjR

### ** Examples

data(don_dat)
kk <- don_dat[1:300,]
zizj <- assoc_Zi.Zj(x=kk)
zizjr <- assoc_Zi.ZjR(x=kk, rZiZj=zizj)
zizjr



