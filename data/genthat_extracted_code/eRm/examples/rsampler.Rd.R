library(eRm)


### Name: rsampler
### Title: Sampling Binary Matrices
### Aliases: rsampler
### Keywords: misc

### ** Examples

data(xmpl)
ctr<-rsctrl(burn_in=10, n_eff=5, step=10, seed=0, tfixed=FALSE)
res<-rsampler(xmpl,ctr)
summary(res)



