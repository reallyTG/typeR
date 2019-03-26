library(solaR)


### Name: C_corrFdKt
### Title: Correlations between the fraction of diffuse irradiation and the
###   clearness index.
### Aliases: corrFdKt FdKtPage FdKtLJ FdKtCPR FdKtEKDd FdKtCLIMEDd FdKtEKDh
###   FdKtCLIMEDh FdKtBRL
### Keywords: utilities

### ** Examples

Ktd=seq(0, 1, .01)
Monthly=data.frame(Ktd=Ktd)
Monthly$Page=FdKtPage(Ktd)
Monthly$LJ=FdKtLJ(Ktd)

xyplot(Page+LJ~Ktd, data=Monthly,
       type=c('l', 'g'), auto.key=list(space='right'))

Ktd=seq(0, 1, .01)
Daily=data.frame(Ktd=Ktd)
Daily$CPR=FdKtCPR(Ktd)
Daily$CLIMEDd=FdKtCLIMEDd(Ktd)

xyplot(CPR+CLIMEDd~Ktd, data=Daily,
       type=c('l', 'g'), auto.key=list(space='right'))




