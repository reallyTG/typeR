library(blink)


### Name: links
### Title: Function that returns the shared MPMMS (except with an easier
###   condition to code than JASA paper).  Function to make a list of
###   vectors of estimated links by "P(MPMMS)>0.5" method Note: The default
###   settings return only MPMMSs with multiple members.
### Aliases: links

### ** Examples

lam.gs <- matrix(c(1,1,2,2,3,3,5,6,4,3,4,5,3,2,4,1,2,3,4,2),ncol=20,  nrow=4)
links(lam.gs)



