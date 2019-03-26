library(lcmm)


### Name: predictYcond
### Title: Conditional predictions of a 'lcmm', 'multlcmm' or 'Jointlcmm'
###   object in the natural scale of the longitudinal outcome(s) for
###   specified latent process values.
### Aliases: predictYcond

### ** Examples

## Not run: 
##D m12 <- lcmm(Ydep2~Time+I(Time^2),random=~Time,subject='ID',ng=1,
##D data=data_lcmm,link="3-equi-splines")
##D predm12 <- predictYcond(m12,lprocess=seq(-8,2,length.out=100),draws=TRUE)
##D plot(predm12)
## End(Not run)




