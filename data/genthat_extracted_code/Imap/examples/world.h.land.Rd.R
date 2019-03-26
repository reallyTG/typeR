library(Imap)


### Name: world
### Title: GSHHS - A Global Self-consistent, Hierarchical, High-resolution
###   Shoreline Database
### Aliases: world world.h.land world.h.lake world.h.island
###   world.h.pond.in.island world.h.rivers world.h.borders npacific
### Keywords: datasets

### ** Examples

## Not run: 
##D 
##D imap(list(world.h.land, world.h.lake, world.h.island, world.h.pond.in.island, world.h.rivers))
##D 
##D # The works with full resolution; high-end computers only.
##D imap(list(world.f.land, world.f.lake, world.f.island, world.f.pond.in.island, world.f.borders, world.f.rivers),
##D             col=c("black", "blue", "forestgreen", "dodgerblue", "cyan", col.alpha('magenta', alpha = 0.5)), 
##D             poly = c("grey50", "blue", "forestgreen", "dodgerblue", NA, NA))
##D 
##D 
##D # The function below will plot selected polygons from 'world.h.land'.
##D imap.world <- function (x = 1:20, poly = rainbow(n), ...) 
##D {
##D     
##D     n <- length(x)
##D     a <- 0
##D     polys <- vector("list", n)
##D     land.index <- (1:nrow(world.h.land))[is.na(world.h.land[,1])]
##D 
##D     for (i in 1:n) 
##D         polys[[i + a]] <- world.h.land[land.index[x[i]]:land.index[x[i] + 1], ]
##D 
##D     
##D     imap(polys, col = 'black', poly = poly, keep.attr = TRUE, ...)
##D     
##D     invisible(polys)
##D }
##D 
##D imap.world()
##D 
##D imap.world(c(5,4,30,50))
##D 
## End(Not run)



