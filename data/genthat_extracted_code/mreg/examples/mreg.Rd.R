library(mreg)


### Name: mreg
### Title: To perform regression when discrete outcome variables are
###   missing
### Aliases: mreg
### Keywords: regression models

### ** Examples

	data(public)
T<-TRUE; F<-FALSE
## Not run: 
##D 
##D mod1 <- mreg( damaged~offset(log(intervisit.time))+esr.init, 
##D data=public,patid=ptno,print.level=2, iterlim=1000 )
##D 
##D 
##D mod.ncar <-mreg(damaged ~ offset(log(intervisit.time)) + esr.init + 
##D     tender + effused + clinic.time, data = public, patid = ptno, 
##D     modify = paper, modify.p = 5, mod.formula = ~art.dur.init, 
##D     density.name = "negbin.ncar", iterlim = 1000, print.level = 2)
##D 
##D 
## End(Not run)
  


