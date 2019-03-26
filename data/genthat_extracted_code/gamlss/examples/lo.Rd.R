library(gamlss)


### Name: lo
### Title: Specify a loess fit in a GAMLSS formula
### Aliases: lo lo.control vis.lo
### Keywords: regression

### ** Examples

# fitting a loess curve with span=0.4 plus the a quarterly  effect 
aids1<-gamlss(y~lo(~x,span=0.4)+qrt,data=aids,family=PO) # 
term.plot(aids1, page=1)
## Not run: 
##D r1 <- gamlss(R~lo(~Fl)+lo(~A), data=rent, family=GA)
##D  term.plot(r1, pages=1)
##D  vis.lo(getSmo(r1, which=1), partial=T)
##D r2 <- gamlss(R~lo(~Fl+A), data=rent, family=GA)
##D  term.plot(r2, pages=1)
##D  vis.lo(getSmo(r2, which=1))
##D  vis.lo(getSmo(r2, which=1), se=1.97)
##D  vis.lo(getSmo(r2, which=1), partial.res=T)
## End(Not run)



