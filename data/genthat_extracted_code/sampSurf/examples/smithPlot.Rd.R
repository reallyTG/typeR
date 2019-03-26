library(sampSurf)


### Name: smithPlot
### Title: A function to make H. F. Smith plots
### Aliases: smithPlot

### ** Examples

#
#  Using smithPlot entails generating several simulations for each sampling
#  method and thus some rather lengthy code--too much so for
#  reproduction here. However, assume that we have several sampSurf
#  simulation objects as follows (see example in Details above)...
#
#  horizontal point sampling:         sshps.3, sshps.5, sshps.7, sshps.9
#  critical height sampling:          sschs.3, sschs.5, sschs.7, sschs.9
#  HPS /w crude Monte Carlo sampling: sscmc.3, sscmc.5, sscmc.7, sscmc.9
#  all with metric bafs 3, 5, 7 and 9.
#
#  Also we have four sampSurf circular plot sampling objects with plot
#  radii 5, 6, 7, and 9m...
#
#  sscps.5, sscps.6, sscps.7, sscps.9 
#
#  Then we can form the input lists required by smithPlot as...
#
## Not run: 
##D hps = list(HPSbaf3 = sshps.3, HPSbaf5 = sshps.5, HPSbaf7 = sshps.7, HPSbaf9 = sshps.9)
##D chs = list(CHSbaf3 = sschs.3, CHSbaf5 = sschs.5, CHSbaf7 = sschs.7, CHSbaf9 = sschs.9)
##D cmc = list(CMCbaf3 = sscmc.3, CMCbaf5 = sscmc.5, CMCbaf7 = sscmc.7, CMCbaf9 = sscmc.9)
##D cps = list(CPSrad5 = sscps.5, CPSrad6 = sscps.6, CPSrad7 = sscps.7, CPSrad9 = sscps.9)
##D hfs = list(hps = hps, chs = chs, cmc = cmc, cps = cps)
##D #
##D #  Finally, we create the Smith plot using...
##D #
##D res = smithPlot(hfs)
##D names(res)  #show the result object names
## End(Not run) 



