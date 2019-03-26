library(RBesT)


### Name: plot.EM
### Title: Diagnostic plots for EM fits
### Aliases: plot.EM

### ** Examples


bmix <- mixbeta(rob=c(0.2, 1, 1), inf=c(0.8, 10, 2))
bsamp <- rmix(bmix, 1000)
bfit <- mixfit(bsamp, type="beta", Nc=2)
pl <- plot(bfit)

print(pl$mixdens)
print(pl$mix)

## Not run: 
##D # a number of additional plots are generated in verbose mode
##D options(RBesT.verbose=TRUE)
##D pl_all <- plot(bfit)
##D 
##D names(pl_all)
##D # [1] "a"   "b"   "w"   "m"   "N"   "Lm"  "lN"  "Lw"  "lli" "mixdens" "mix"
## End(Not run)




