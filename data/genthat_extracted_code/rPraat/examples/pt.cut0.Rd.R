library(rPraat)


### Name: pt.cut0
### Title: pt.cut0
### Aliases: pt.cut0

### ** Examples

pt <- pt.sample()
pt2 <-   pt.cut(pt,  tStart = 3)
pt2_0 <- pt.cut0(pt, tStart = 3)
pt3 <-   pt.cut(pt,  tStart = 2, tEnd = 3)
pt3_0 <- pt.cut0(pt, tStart = 2, tEnd = 3)
pt4 <-   pt.cut(pt,  tEnd = 1)
pt4_0 <- pt.cut0(pt, tEnd = 1)
pt5 <-   pt.cut(pt,  tStart = -1, tEnd = 1)
pt5_0 <- pt.cut0(pt, tStart = -1, tEnd = 1)
## Not run: 
##D pt.plot(pt)
##D pt.plot(pt2)
##D pt.plot(pt2_0)
##D pt.plot(pt3)
##D pt.plot(pt3_0)
##D pt.plot(pt4)
##D pt.plot(pt4_0)
##D pt.plot(pt5)
##D pt.plot(pt5_0)
## End(Not run)



