library(pbkrtest)


### Name: getkr
### Title: Extract (or "get") components from a 'KRmodcomp' object.
### Aliases: getKR getkr
### Keywords: utilities

### ** Examples


data(beets, package='pbkrtest')
lg <- lmer(sugpct ~ block + sow + harvest + (1|block:harvest), 
              data=beets, REML=FALSE)
sm <- update(lg, .~. - harvest)
xx <- KRmodcomp(lg, sm)
getKR(xx, "ddf") # get denominator degrees of freedom.





