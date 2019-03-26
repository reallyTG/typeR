library(wbs)


### Name: wbs-package
### Title: Wild Binary Segmentation for multiple change-point detection
### Aliases: wbs-package
### Keywords: math models ts

### ** Examples

#an example in which standard Binary Segmentation fails to detect change points
x <- rnorm(300)+ c(rep(0,130),rep(-1,20),rep(1,20),rep(0,130))

s <- sbs(x)
w <- wbs(x)

s.cpt <- changepoints(s)
s.cpt

w.cpt <- changepoints(w)
w.cpt
# in this example, both algorithms work well
x <- rnorm(300) + c(rep(1,50),rep(0,250))

s <- sbs(x)
w <- wbs(x)

s.cpt <- changepoints(s)
s.cpt

w.cpt <- changepoints(w)
w.cpt



