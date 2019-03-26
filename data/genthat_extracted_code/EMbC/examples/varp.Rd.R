library(EMbC)


### Name: varp
### Title: Variables' profile plots
### Aliases: varp varp,binClstPath-method varp,matrix-method

### ** Examples

# -- apply EMbC to the example path --
mybcp <- stbc(expth,info=-1)
# -- plot clustering data points --
varp(mybcp@X)
# -- plot data points' certainties --
varp(mybcp@U)
# -- plot intermediate computations (span-times, distances and headings) in one figure --
varp(mybcp)
## Not run: 
##D # -- plot only span-times between locations a and b --
##D plot(seq(a,b),mybcp@spn[a:b],col=4,type='l',xlab='loc',ylab='spanTime (s)')
## End(Not run)



