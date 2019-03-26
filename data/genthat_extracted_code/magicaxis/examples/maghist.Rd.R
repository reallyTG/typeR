library(magicaxis)


### Name: maghist
### Title: Magically pretty histograms
### Aliases: maghist
### Keywords: hist histogram

### ** Examples

maghist(rnorm(1e4))
maghist(rnorm(1e4), xlim=c(-2,4))

#Notice the x-limits are close to -3/3, since  if we ask for xlim=3 (a 3-sigma range)

maghist(rnorm(1e4), xlim=3, verbose = FALSE)

#The 'auto' option allows magclip to dynamically estimate a clip value (which is similar
#in this case, but need not be in general).

maghist(rnorm(1e4), xlim='auto', verbose = FALSE)

#Test of log histograms:

testdata=10^(runif(1e3,0,4))
maghist(testdata)
maghist(testdata,log='x')
maghist(testdata,log='y')
maghist(testdata,log='xy')

maghist(testdata,freq=FALSE)
maghist(testdata,freq=FALSE,log='x')
maghist(testdata,freq=FALSE,log='y')
maghist(testdata,freq=FALSE,log='xy')

#Test of plotting histogram objects:

testhist=maghist(testdata,log='xy')
maghist(testhist)
maghist(testhist,log='x')
magplot(testhist,log='y')
magplot(testhist,log='xy')

#Nice to see a grid with large ranges:

maghist(rnorm(1e6), grid=TRUE)
maghist(rnorm(1e6), log='y', grid=TRUE)



