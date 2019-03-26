library(DACF)


### Name: lw.f.star
### Title: lw.f.star
### Aliases: lw.f.star

### ** Examples

dat=threeganova.sim(1000,.16,1)
dat[dat$group==1,3]=induce.cfe(0,.15,dat[dat$group==1,3])
lw.f.star(dat,y~group,"a") #using truncated n
lw.f.star(dat,y~group,"b") #using original n



