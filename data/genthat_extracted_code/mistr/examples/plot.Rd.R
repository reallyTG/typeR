library(mistr)


### Name: Distribution_autoplot
### Title: Autoplot of Distributions
### Aliases: Distribution_autoplot plot.compdist plot.trans_compdist
###   plot.contdist plot.trans_contdist plot.discrdist plot.trans_discrdist
###   plot.contmixdist plot.trans_contmixdist plot.discrmixdist
###   plot.trans_discrmixdist plot.contdiscrmixdist
###   plot.trans_contdiscrmixdist

### ** Examples

N <- normdist()
plot(N)

# manipulating cdf plot
B <- binomdist(12, 0.5)
plot(-3*B, which = "cdf", xlim1 = c(-30, -10))
# manipulating pdf plot
plot(-3*B, which = "pdf", xlim1 = c(-30, -10))



