library(pems.utils)


### Name: 3.1.2.vsp.calculations
### Title: Vehicle Specific Power (VSP) calculations
### Aliases: 3.1.2.vsp.calculations vsp.calculations vsp calcVSP
###   calcVSP_JimenezPalacios binVSP binVSP_NCSU.14 binVSP_MOVES.23
### Keywords: methods

### ** Examples


###########
##example 1 
###########

#basic usage

vsp <- calcVSP(velocity, time = local.time, data = pems.1)
#where the returned object, vsp, is vsp values as pems.element

ncsu.14 <- binVSP(vsp)
#where the returned object, nscu.14, is the associated modal bin 
# assignments based on the Frey et al (2002) 14 bin method. 




