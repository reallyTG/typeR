library(RBMRB)


### Name: HSQC_13C
### Title: Simulates H1-C13 HSQC spectra for a given entry or list of
###   entries from BMRB
### Aliases: HSQC_13C

### ** Examples

plot_hsqc<-HSQC_13C(c(17074,17076,17077))
#Simulates C13-HSQC spectra form the given list of entries
plot_hsqc<-HSQC_13C(c(17074,17076,17077),'line')
#Simulates C13-HSQC and connects the peaks with same sequence number
plot_hsqc<-HSQC_13C(c(17074,17076,17077),interactive=FALSE)
#Example for non interactive plot



