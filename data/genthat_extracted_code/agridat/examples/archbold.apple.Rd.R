library(agridat)


### Name: archbold.apple
### Title: Split-split plot experiment on apple trees
### Aliases: archbold.apple
### Keywords: datasets

### ** Examples


data(archbold.apple)
dat <- archbold.apple

# Define main plot and subplot
dat <- transform(dat, rep=factor(rep), spacing=factor(spacing), trt=factor(trt),
                 mp = factor(paste(row,spacing,sep="")),
                 sp = factor(paste(row,spacing,stock,sep="")))

# Due to 'spacing', the plots are different sizes, but the following layout
# shows the relative position of the plots and treatments. Note that the
# 'spacing' treatments are not contiguous in some reps.
if(require(desplot)){
  desplot(spacing~row*pos, dat,
          col=stock, cex=1, num=gen, # aspect unknown
          main="archbold.apple")
}


## Not run: 
##D   require("lme4")
##D   require("lucid")
##D   
##D   m1 <- lmer(yield ~ -1 + trt + (1|rep/mp/sp), dat)
##D   
##D   vc(m1)  # Variances/means on Cornelius, page 59
##D   ##         grp        var1 var2   vcov sdcor
##D   ## sp:(mp:rep) (Intercept) <NA>  193.3 13.9
##D   ##      mp:rep (Intercept) <NA>  203.8 14.28
##D   ##         rep (Intercept) <NA>  197.3 14.05
##D   ##    Residual        <NA> <NA> 1015   31.86
##D   
## End(Not run)





