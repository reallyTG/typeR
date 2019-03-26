library(RTOMO)


### Name: FANCY.TOMO
### Title: Show horizontal tomographic section layer by layer
### Aliases: FANCY.TOMO
### Keywords: misc

### ** Examples


data(HELMOD)
data(HELMAP)

for(i in 1:length(HELMOD$MOD))
{
##  i = 4
FANCY.TOMO(HELMOD, i, MAP=HELMAP, bkgr="beige")

locator()


}




