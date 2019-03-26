library(jlctree)


### Name: jlctree
### Title: Fits Joint Latent Class Tree (JLCT) model.
### Aliases: jlctree

### ** Examples

 # Time-to-event in LTRC format:
 data(data_timevar)
 tree <- jlctree(survival=Surv(time_L, time_Y, delta)~X3+X4+X5,
                 classmb=~X1+X2, fixed=y~X1+X2+X3+X4+X5, random=~1,
                 subject='ID',data=subset(data_timevar, ID<=30),
                 parms=list(maxng=4, fity=FALSE, fits=FALSE))

 # Time-to-event in right-censored format:
 data(data_timeinv)
 tree <- jlctree(survival=Surv(time_Y, delta)~X3+X4+X5,
                 classmb=~X1+X2, fixed=y~X1+X2+X3+X4+X5, random=~1,
                 subject='ID', data=subset(data_timeinv, ID<=30),
                 parms=list(maxng=4, fity=FALSE, fits=FALSE))




