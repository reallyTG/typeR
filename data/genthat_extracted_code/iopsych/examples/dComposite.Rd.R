library(iopsych)


### Name: dComposite
### Title: Estimates the d of a composite.
### Aliases: dComposite

### ** Examples

Rxx <- matrix(.3, 3, 3); diag(Rxx) <- 1
ds  <- c(.2, .4, .3)
dComposite(rxx = Rxx, d_vec = ds)

Rxx <- matrix(c(1.0, 0.3, 0.2, 
                0.3, 1.0, 0.1,
                0.2, 0.1, 1.0), 3, 3)
ds  <- c(.1, .3, .7)
ws  <- c(1, .5, .5)
dComposite(rxx = Rxx, d_vec = ds, wt_vec = ws)



