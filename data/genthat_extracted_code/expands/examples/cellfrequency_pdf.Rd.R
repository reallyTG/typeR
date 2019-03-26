library(expands)


### Name: cellfrequency_pdf
### Title: Computes the probability distribution of cellular frequencies
###   for a single mutation.
### Aliases: cellfrequency_pdf

### ** Examples

freq=seq(0.1,1.0,by=0.01);
cfd=cellfrequency_pdf(af=0.26,cnv=1.95,pnb=0,freq=freq, max_PM=6)
plot(freq,cfd$p,type="l",xlab="f",ylab="P(f)");



