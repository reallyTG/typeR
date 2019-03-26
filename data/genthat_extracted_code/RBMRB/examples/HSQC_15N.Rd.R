library(RBMRB)


### Name: HSQC_15N
### Title: Simulates H1-N15 HSQC spectra for a given entry or list of
###   entries from BMRB
### Aliases: HSQC_15N

### ** Examples

plot_hsqc<-HSQC_15N(c(17074,17076,17077))
#simulates N15-HSQC spectra for the given 3 entreis
plot_hsqc<-HSQC_15N(18857,'line')
#simulates the N15-HSQC spectra from many chemical shift lists from a single entry
plot_hsqc<-HSQC_15N(c(17074,17076,17077),interactive=FALSE)
#example for non interactive plots



