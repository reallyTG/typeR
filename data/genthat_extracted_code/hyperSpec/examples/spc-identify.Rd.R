library(hyperSpec)


### Name: spc.identify
### Title: Identifying Spectra and Spectral Data Points This function
###   allows to identify the spectrum and the wavelength of a point in a
###   plot produced by 'plotspc'.
### Aliases: spc.identify spc.label.default spc.label.wlonly
###   spc.point.default spc.point.max spc.point.min spc.point.sqr
###   spc.point.max spc.point.default spc.point.min spc.point.sqr
###   spc.label.default spc.label.wlonly
### Keywords: iplot

### ** Examples


if (interactive ()){
ispc <- sample (nrow (laser), 10)
ispc

identified <- spc.identify (plotspc (laser[ispc]))

## convert to the "real" spectra indices
ispc [identified$ispc]
identified$wl
identified$spc

## allow the labels to be plotted into the plot margin
spc.identify (plotspc (laser[ispc]), ispc = ispc, xpd = NA) 

spc.identify (plotspc (paracetamol, xoffset = 1100,
              wl.range = c (600 ~ 1700, 2900 ~ 3150)),
              formatter = spc.label.wlonly)

## looking for minima
spc.identify (plot (-paracetamol, wl.reverse = TRUE),
              point.fn = spc.point.min, adj = c (1, 0.5))

}




