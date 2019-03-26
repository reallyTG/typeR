library(sppmix)


### Name: rMIPPP_cond_loc
### Title: Generate a Marked Poisson point process (conditional on
###   location)
### Aliases: rMIPPP_cond_loc

### ** Examples

## No test: 
# Create a marked point pattern; use randomization and discrete marks (default values)
newMPP=rMIPPP_cond_loc()
plot(newMPP$surf,main="True IPPP intensity surface for the locations")
newMPP$gammas
newMPP$genMPP
newMPP$r
print(table(newMPP$genMPP$marks))
#we can reproduce the random field plots anytime using the following call
plot_MPP_fields(newMPP$genMPP,newMPP$gammas,newMPP$r)
#Now generate continuous marks according to a Gaussian process
newMPP=rMIPPP_cond_loc(discrete_mark = FALSE)
plot(newMPP$surf,main="True IPPP intensity surface for the locations")
#now the marks are taken from a chi-square field
newMPP=rMIPPP_cond_loc(mark_distr_choice=1, discrete_mark = FALSE)
plot(newMPP$surf,main="True IPPP intensity surface for the locations")
## End(No test)




