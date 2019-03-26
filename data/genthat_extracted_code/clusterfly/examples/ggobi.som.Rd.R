library(clusterfly)


### Name: ggobi.som
### Title: Visualise Kohonen self organising maps with GGobi Displays both
###   data, and map in original high-d space.
### Aliases: ggobi.som
### Keywords: cluster dynamic

### ** Examples

## Not run: 
##D d.music <- read.csv("http://www.ggobi.org/book/data/music-all.csv")
##D 
##D music <- rescaler(d.music)[complete.cases(d.music), 1:10]
##D music.som <- som::som(music[,-(1:3)], 6, 6, neigh="bubble", rlen=1000)
##D ggobi(music.som)
## End(Not run)
## Not run: 
##D d.music <- read.csv("http://www.ggobi.org/book/data/music-all.csv")
##D 
##D music <- rescaler(d.music)[complete.cases(d.music), 1:10]
##D music.hex <- kohonen::som(music[,-(1:3)], grid = somgrid(3, 3, "hexagonal"), rlen=1000)
##D music.rect <- kohonen::som(music[,-(1:3)], grid = somgrid(6, 6, "rectangular"), rlen=1000)
##D ggobi(music.rect)
## End(Not run)



