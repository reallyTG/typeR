library(sppmix)


### Name: plot_MPP_probs
### Title: Plot the mark probabilities of a marked point pattern
### Aliases: plot_MPP_probs

### ** Examples

## No test: 
newMPP=rMIPPP_cond_loc(gammas=c(.1,.2,.5))
plot(newMPP$surf,main="True IPPP intensity surface for the locations")
genMPP=newMPP$genMPP
newMPP$r
mpp_est <- est_MIPPP_cond_loc(genMPP,newMPP$r, hyper=0.2)
plot_MPP_probs(mpp_est)
## End(No test)




