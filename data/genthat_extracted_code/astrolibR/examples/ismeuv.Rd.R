library(astrolibR)


### Name: ismeuv
### Title: Compute the continuum interstellar extreme ultraviolet (EUV)
###   optical depth
### Aliases: ismeuv
### Keywords: misc

### ** Examples

	
# One has a model EUV spectrum with wavelength, w (in Angstroms) and 
# flux,f .  Plot the model flux after attenuation by 1e18 cm-2 of HI, 
# with N(HeI)/N(HI) = N(HeII)/N(HI) = 0.05

hcol = 1e18
w = seq(100,900,length=801)
ismeuv(w, hcol)

# f = rep(1,length=8*20)
# plot(w, f*exp(-ismeuv(w, hcol, .05*hcol, .05*hcol)), pch=20)

#  Plot the cross-section of HeI from 180 A to 220 A for 1e18 cm-2
#  of HeI, showing the auto-ionizing resonances.   This is 
#  Figure 1 in Rumph et al. (1994)

# w = 180 + seq(0,40,length=40000        # create a fine wavelength grid
# plot(w, ismeuv(w, 0, 1e18, fano=TRUE), pch=20)          



