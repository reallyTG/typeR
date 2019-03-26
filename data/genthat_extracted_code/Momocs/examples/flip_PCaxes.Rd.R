library(Momocs)


### Name: flip_PCaxes
### Title: Flips PCA axes
### Aliases: flip_PCaxes

### ** Examples

bp <- bot %>% efourier(6) %>% PCA
bp %>% plot
bp %>% flip_PCaxes(1) %>% plot()



