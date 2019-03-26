library(TPMplt)


### Name: SSplots
### Title: Automatic completion for Stress-Strain plots
### Aliases: SSplots
### Keywords: SSplots lyIDdetector

### ** Examples

## Not run: 
##D require(VBTree)
##D # Find locations for temperature and strain rate:
##D # temperature in layer2, strain rate in layer3;
##D # Strain in layer1 level1, Stress in layer1 level2.
##D dl2vbt(chrvec2dl(colnames(TPMdata)))
##D 
##D # Attention: Zoom your Plots panes large enough to ensure
##D # correct output!
##D 
##D # Plot multiple Stress-Strain curves, grouped by strain rate:
##D SSplots(TPMdata, 3, mfrow=c(3, 3))
##D 
##D # Plot multiple Stress-Strain curves, grouped by temperature:
##D SSplots(TPMdata, 2, mfrow=c(2, 2))
##D 
##D # Manual setting, for Stress-Stain plots:
##D SSplots(TPMdata, 2, manual=c(1, 1, 2), mfrow=c(2, 2))
## End(Not run)



