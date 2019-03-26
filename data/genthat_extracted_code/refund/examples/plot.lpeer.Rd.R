library(refund)


### Name: plot.lpeer
### Title: Plotting of estimated regression functions obtained through
###   'lpeer()'
### Aliases: plot.lpeer

### ** Examples

## Not run: 
##D data(DTI)
##D cca = DTI$cca[which(DTI$case == 1),]
##D DTI = DTI[which(DTI$case == 1),]
##D fit.cca.lpeer1 = lpeer(Y=DTI$pasat, t=DTI$visit, subj=DTI$ID, funcs = cca)
##D plot(fit.cca.lpeer1)
## End(Not run)



