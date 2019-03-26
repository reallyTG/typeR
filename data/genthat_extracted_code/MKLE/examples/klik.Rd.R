library(MKLE)


### Name: klik
### Title: Kernel log likelihood
### Aliases: klik
### Keywords: distribution nonparametric

### ** Examples

data(state)
attach(state)
bw<-2*sd(CRIME)
kdensity<-density(CRIME,bw=bw,kernel="biweight",
          from=min(CRIME)-2*bw,to=max(CRIME)+2*bw,n=2^12)
min<-kdensity$x[1]
grid<-kdensity$x[2]-min

# finds the kernel log likelihood at the sample mean
klik(0,CRIME, kdensity, grid, min)




