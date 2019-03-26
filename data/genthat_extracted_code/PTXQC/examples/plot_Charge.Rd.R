library(PTXQC)


### Name: plot_Charge
### Title: The plots shows the charge distribution per Raw file. The output
###   of 'mosaicize()' can be used directly.
### Aliases: plot_Charge

### ** Examples

 data = data.frame(raw.file = c(rep('file A', 100), rep('file B', 40)),
                       data = c(rep(2, 60), rep(3, 30), rep(4, 10),
                                rep(2, 30), rep(3, 7), rep(4, 3)))
 plot_Charge(mosaicize(data))




