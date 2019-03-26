library(sppmix)


### Name: plot_MPP_fields
### Title: Plot the mark probability fields
### Aliases: plot_MPP_fields

### ** Examples

## No test: 
newMPP=rMIPPP_cond_loc(gammas=c(.1,.2,.5), r=.5)
plot(newMPP$surf,main="True IPPP intensity surface for the locations")
plot_MPP_fields(newMPP$genMPP,newMPP$gammas,newMPP$r)
plot_MPP_fields(newMPP$genMPP,newMPP$gammas,1)
plot_MPP_fields(newMPP$genMPP,newMPP$gammas,1.5)
plot_MPP_fields(newMPP$genMPP,newMPP$gammas,2)
## End(No test)




