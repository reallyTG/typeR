library(NSM3)


### Name: pSDCFlig
### Title: Dwass, Steel, Critchlow, Fligner
### Aliases: pSDCFlig
### Keywords: Dwass Steel Critchlow-Fligner

### ** Examples

gizzards<-list(site.I=c(46,28,46,37,32,41,42,45,38,44),
              site.II=c(42,60,32,42,45,58,27,51,42,52),
              site.III=c(38,33,26,25,28,28,26,27,27,27),
              site.IV=c(31,30,27,29,30,25,25,24,27,30))
##Takes a little while 
#pSDCFlig(gizzards,method="Monte Carlo")

##Shorter version for demonstration
pSDCFlig(gizzards[1:2],method="Asymptotic")



