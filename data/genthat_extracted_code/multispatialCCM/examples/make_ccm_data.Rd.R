library(multispatialCCM)


### Name: make_ccm_data
### Title: Makes fake data for other functions
### Aliases: make_ccm_data
### Keywords: ts

### ** Examples

#Simulate data to use for multispatial CCM test
#See function for details - A is causally forced by B,
#but the reverse is not true.
ccm_data_out<-make_ccm_data()
Accm<-ccm_data_out$Accm
Bccm<-ccm_data_out$Bccm



