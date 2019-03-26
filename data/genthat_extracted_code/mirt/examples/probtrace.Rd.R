library(mirt)


### Name: probtrace
### Title: Function to calculate probability trace lines
### Aliases: probtrace
### Keywords: tracelines

### ** Examples


mod <- mirt(Science, 1)
extr.2 <- extract.item(mod, 2)
Theta <- matrix(seq(-4,4, by = .1))
traceline <- probtrace(extr.2, Theta)
head(data.frame(traceline, Theta=Theta))




