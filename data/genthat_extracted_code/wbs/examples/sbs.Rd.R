library(wbs)


### Name: sbs
### Title: Change-point detection via standard Binary Segmentation
### Aliases: sbs sbs.default

### ** Examples

x <- rnorm(300) + c(rep(1,50),rep(0,250))
s <- sbs(x)
s.cpt <- changepoints(s)
s.cpt
th <- c(s.cpt$th,0.7*s.cpt$th)
s.cpt <- changepoints(s,th=th)
s.cpt



