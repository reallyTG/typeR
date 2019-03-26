library(wsyn)


### Name: coh_methods
### Title: Basic methods for the 'coh' class
### Aliases: coh_methods summary.coh print.coh set_times.coh
###   set_timescales.coh set_coher.coh set_dat1.coh set_dat2.coh
###   set_wtopt.coh set_norm.coh set_sigmethod.coh set_signif.coh
###   set_ranks.coh set_bandp.coh get_times.coh get_timescales.coh
###   get_coher.coh get_dat1.coh get_dat2.coh get_wtopt.coh get_norm.coh
###   get_sigmethod.coh get_signif.coh get_ranks.coh get_bandp.coh

### ** Examples

times<-1:100
dat1<-matrix(rnorm(1000),10,100)
dat2<-matrix(rnorm(1000),10,100)
dat1<-cleandat(dat1,times,1)$cdat
dat2<-cleandat(dat2,times,1)$cdat
norm<-"powall"
sigmethod<-"fast"
nrand<-10
h<-coh(dat1,dat2,times,norm,sigmethod,nrand)
get_times(h)
summary(h)
print(h)




