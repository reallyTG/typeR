library(zipfR)


### Name: vgc
### Title: Vocabulary Growth Curves (zipfR)
### Aliases: vgc vgc.object
### Keywords: classes

### ** Examples


## load Dickens' work empirical vgc and take a look at it

data(Dickens.emp.vgc)
summary(Dickens.emp.vgc)
print(Dickens.emp.vgc)

plot(Dickens.emp.vgc,add.m=1)

## vectors of sample sizes in the vgc, and the
## corresponding V and V_1 vectors
Ns <- N(Dickens.emp.vgc)
Vs <- V(Dickens.emp.vgc)
Vm <- V(Dickens.emp.vgc,1)

## binomially interpolated V and V_1 at the same sample sizes
## as the empirical curve
data(Dickens.spc)
Dickens.bin.vgc <- vgc.interp(Dickens.spc,N(Dickens.emp.vgc),m.max=1)

## compare observed and interpolated
plot(Dickens.emp.vgc,Dickens.bin.vgc,add.m=1,legend=c("observed","interpolated"))


## load Italian ultra- prefix data
data(ItaUltra.spc)

## compute zm model
zm <- lnre("zm",ItaUltra.spc)

## compute vgc up to about twice the sample size
## with variance of V
zm.vgc <- lnre.vgc(zm,(1:100)*70, variances=TRUE)

summary(zm.vgc)
print(zm.vgc)

## plot with confidence intervals derived from variance in
## vgc (with larger datasets, ci will typically be almost
## invisible)
plot(zm.vgc)

## for more examples of vgc usages, see manpages of lnre.vgc,
## plot.vgc, print.vgc  and vgc.interp





