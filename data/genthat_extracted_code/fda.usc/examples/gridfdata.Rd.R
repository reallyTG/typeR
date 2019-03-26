library(fda.usc)


### Name: gridfdata, rcombfdata
### Title: Utils for generate functional data
### Aliases: gridfdata rcombfdata
### Keywords: generation

### ** Examples

tt=seq(0,1,len=51)
fou3=create.fourier.basis(c(0,1),nbasis=3)
fdataobj=fdata(t(eval.basis(tt,fou3)),argvals=tt)

coef=expand.grid(0,seq(-1,1,len=11),seq(-1,1,len=11))
grid=gridfdata(coef,fdataobj)
plot(grid,lty=1)

rcomb=rcombfdata(n=51,fdataobj,mu=fdata(30*tt*(1-tt),tt))
plot(rcomb,lty=1)



