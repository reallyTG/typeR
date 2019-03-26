library(corrDNA)


### Name: assoc_comb
### Title: Complete association matrix.
### Aliases: assoc_comb

### ** Examples

## No test: 
data(don_dat)
kk <- don_dat[1:300,]
zizj <- assoc_Zi.Zj(x=kk)
zizjr <- assoc_Zi.ZjR(x=kk, rZiZj=zizj)
zizjy <- assoc_Zi.ZjY(x=kk, rZiZj=zizj)
zirzjr <- assoc_ZiR.ZjR(x=kk,rZiZj=zizj,rZiZjR=zizjr)
zirzjy <- assoc_ZiR.ZjY(x=kk,rZiZj=zizj,rZiZjR=zizjr,rZiZjY=zizjy)
ziyzjy <- assoc_ZiY.ZjY(x=kk,rZiZj=zizj,rZiZjY=zizjy)
fin_corr <- assoc_comb(x=kk, rZiZj=zizj,rZiZjR=zizjr,rZiZjY=zizjy,
rZiRZjR=zirzjr,rZiRZjY=zirzjy,rZiYZjY=ziyzjy)
fin_corr
## End(No test)



