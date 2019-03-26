library(DDHFm)


### Name: hftrialdatagen
### Title: Gene intensities simulator and DDHFm tester
### Aliases: hftrialdatagen
### Keywords: datagen manip

### ** Examples

#
# First run hftrialdatagen
#
## Not run: v <- hftrialdatagen()
#
# Now plot the Haar-Fisz transformed intensities.
#
## Not run: ts.plot(v$yhf)
#
# Now plot the denoised intensities 
#
# Note that above we have 128 genes and 4 replicates and so there are
# 4*128 = 512 intensities to plot.
#
# However, there are only 128 gene intensities, and estimates. So, for this
# plot we choose to plot the noisy intensities and then for each replicate
# group (which are colocated on the plot) plot the (necessarily constant)
# true and estimated intensities (ie we plot each true/estimated intensity
# 4 times, once for each replicate).
#
# First estimates...
#
## Not run: lines(1:512, rep(v$ansm[,1], rep(4,128)), col=2)
#
# Now plot the truth
#
## Not run: lines(1:512, rep(v$ansm[,2], rep(4,128)), col=3)



