library(cem)


### Name: relax.cem
### Title: Diagnostic tool for CEM
### Aliases: relax.cem relax.plot
### Keywords: datagen

### ** Examples

## Not run: 
##D data(LL)
##D 
##D mat <- cem(treatment="treated",data=LL, drop="re78", keep.all=TRUE)
##D mat
##D tab <- relax.cem(mat, LL, depth=1, plot=FALSE)
##D 
##D relax.plot(tab, group="1")
##D plot(tab, group="1")
##D relax.plot(tab, group="1", unique=TRUE)
##D relax.plot(tab, group="1", perc=0.6)
##D relax.plot(tab, group="1", perc=0.6,unique=TRUE)
##D 
##D 
##D tab1 <- relax.cem(mat, LL, depth=1, minimal=list(re74=6, age=3, education=3, re75=5))
##D tab2 <- relax.cem(mat, LL, depth=1, minimal=list(re74=6, age=3,
##D                   education=3, re75=5), shifts=0.01)
##D tab3 <- relax.cem(mat, LL, depth=1, minimal=list(age=3, education=3),
##D                   fixed=c("re74","re75"))
##D tab4 <- relax.cem(mat, LL, depth=2, minimal=list(age=4,
##D                    education=3,re75=6),plot=FALSE, fixed="re74")
##D relax.plot(tab4)
##D relax.plot(tab4, unique=TRUE)
##D relax.plot(tab4, perc=0.7) 
## End(Not run)



