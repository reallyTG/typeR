library(TripleR)


### Name: plot_missings
### Title: Plot missing values
### Aliases: plot_missings

### ** Examples

data(multiGroup)
m2 <- multiGroup
m2$ex[m2$perceiver.id==90201] <- NA
m2$ex[m2$perceiver.id>92001] <- NA
m2$ex[sample(nrow(m2),  1000)] <- NA
plot_missings(ex~perceiver.id*target.id|group.id, data=m2)
(RR1m <- RR(ex~perceiver.id*target.id|group.id, data=m2, na.rm=TRUE))



