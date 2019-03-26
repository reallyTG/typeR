library(ssdtools)


### Name: autoplot.fitdistcens
### Title: Autoplot
### Aliases: autoplot.fitdistcens

### ** Examples

fluazinam_lnorm$censdata$right[3] <- fluazinam_lnorm$censdata$left[3] * 1.5
fluazinam_lnorm$censdata$left[5] <- NA
ggplot2::autoplot(fluazinam_lnorm)



