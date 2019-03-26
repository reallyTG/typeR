library(wbs)


### Name: wbs
### Title: Change-point detection via Wild Binary Segmentation
### Aliases: wbs wbs.default

### ** Examples

x <- rnorm(300) + c(rep(1,50),rep(0,250))
w <- wbs(x)
plot(w)
w.cpt <- changepoints(w)
w.cpt
th <- c(w.cpt$th,0.7*w.cpt$th)
w.cpt <- changepoints(w,th=th)
w.cpt$cpt.th



