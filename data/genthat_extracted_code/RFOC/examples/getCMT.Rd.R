library(RFOC)


### Name: getCMT
### Title: Read CMT
### Aliases: getCMT
### Keywords: misc

### ** Examples


## Not run: 
##D 
##D 
##D g = getCMT("/home/lees/aleut.cmt")
##D 
##D pg = prepFOCS(g)
##D 
##D 
##D plot(range(pg$LONS), range(pg$LATS), type = "n", xlab = "LON",
##D     ylab = "LAT", asp = 1)
##D 
##D 
##D  for (i in 1:length(pg$LATS)) {
##D     mc = CONVERTSDR(g$str1[i], g$dip1[i], g$rake1[i])
##D      MEC <- MRake(mc$M)
##D MEC$UP = FALSE
##D      Fcol <- foc.color(foc.icolor(MEC$rake1), pal = 1)
##D      justfocXY(MEC, x = pg$LONS[i], y = pg$LATS[i], focsiz = 0.4,
##D      fcol = Fcol, xpd = FALSE)
##D  }
##D 
##D 
##D 
## End(Not run)







