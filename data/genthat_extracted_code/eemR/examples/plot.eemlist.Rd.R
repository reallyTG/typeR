library(eemR)


### Name: plot.eemlist
### Title: Surface plot of eem
### Aliases: plot.eemlist

### ** Examples

folder <- system.file("extdata/cary/scans_day_1/", package = "eemR")
eem <- eem_read(folder)

plot(eem, which = 3)



