library(multispatialCCM)


### Name: ccmtest
### Title: Test for significant causal signal
### Aliases: ccmtest
### Keywords: ts

### ** Examples

#Simulate data to use for multispatial CCM test
#See function for details - A is causally forced by B,
#but the reverse is not true.
ccm_data_out<-make_ccm_data()
Accm<-ccm_data_out$Accm
Bccm<-ccm_data_out$Bccm

#Set optimal E - see multispatialCCM for details
E_A<-2
E_B<-3

#Run the CCM test
#E_A and E_B are the embedding dimensions for A and B.
#tau is the length of time steps used (default is 1)
#iterations is the number of bootsrap iterations (default 100)
# Does A "cause" B?
CCM_boot_A<-CCM_boot(Accm, Bccm, E_A, tau=1, iterations=10)
# Does B "cause" A?
CCM_boot_B<-CCM_boot(Bccm, Accm, E_B, tau=1, iterations=10)

(CCM_significance_test<-ccmtest(CCM_boot_A,
                   CCM_boot_B))



