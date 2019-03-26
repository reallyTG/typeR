library(highriskzone)


### Name: bootcorr
### Title: Bootstrap correction to obtain desired failure probability
### Aliases: bootcorr

### ** Examples

## Not run: 
##D data(craterB)
##D set.seed(4321)
##D 
##D bc <- bootcor(ppdata=craterB, cutoff=0.2, numit=100, tol=0.02, nxprob=0.1)
##D bc
##D summary(bc)
##D plot(bc)
##D 
##D 
##D hrzbc <- det_hrz(craterB, type = "intens", criterion = "indirect", 
##D cutoff = bc$alphastar, nxprob = 0.1)
## End(Not run)



