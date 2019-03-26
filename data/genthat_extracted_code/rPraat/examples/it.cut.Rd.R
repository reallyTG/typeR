library(rPraat)


### Name: it.cut
### Title: it.cut
### Aliases: it.cut

### ** Examples

it <- it.sample()
it2 <-   it.cut(it,  tStart = 0.3)
it2_0 <- it.cut0(it, tStart = 0.3)
it3 <-   it.cut(it,  tStart = 0.2, tEnd = 0.3)
it3_0 <- it.cut0(it, tStart = 0.2, tEnd = 0.3)
it4 <-   it.cut(it,  tEnd = 0.3)
it4_0 <- it.cut0(it, tEnd = 0.3)
it5 <-   it.cut(it,  tStart = -1, tEnd = 1)
it5_0 <- it.cut0(it, tStart = -1, tEnd = 1)
## Not run: 
##D it.plot(it)
##D it.plot(it2)
##D it.plot(it2_0)
##D it.plot(it3)
##D it.plot(it3_0)
##D it.plot(it4)
##D it.plot(it4_0)
##D it.plot(it5)
##D it.plot(it5_0)
## End(Not run)



