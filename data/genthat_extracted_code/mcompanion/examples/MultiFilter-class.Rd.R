library(mcompanion)


### Name: MultiFilter-class
### Title: Class "MultiFilter"
### Aliases: MultiFilter-class [,MultiFilter,ANY,ANY,ANY-method
###   initialize,MultiFilter-method mcStable,MultiFilter-method
### Keywords: classes

### ** Examples

showClass("MultiFilter")

m <- mCompanion("sim",dim=3,mo=2)   # simulate a 3x3 2-comp. matrix
flt <- new("MultiFilter", mc = m )
flt[]
mf_period(flt)
mf_poles(flt)
abs(mf_poles(flt))

mf_VSform(flt,form="U")
mf_VSform(flt,form="L")
mf_VSform(flt,form="I")


# try arguments "coef" and "mc", for comparison
rfi <- sim_pcfilter(2,3) # period=2, order=c(3,3)
# per. filter from a multi-companion matrix
flt1 <- new("MultiFilter",mc=  mCompanion(zapsmall(rfi$mat)) )
flt1[]
mf_period(flt1)
mf_poles(flt1)
abs(mf_poles(flt1))

mf_VSform(flt1,form="U")
mf_VSform(flt1,form="L")
mf_VSform(flt1,form="I")

# per. filter from coefficients, should be the same (numerically)
flt2 <- new("MultiFilter",coef=rfi$pcfilter)
flt2[]
mf_period(flt2)
mf_poles(flt2)
abs(mf_poles(flt2))

mf_VSform(flt2,form="U")
mf_VSform(flt2,form="L")
mf_VSform(flt2,form="I")




