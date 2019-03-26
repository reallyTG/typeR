library(dplR)


### Name: plotRings
### Title: Plot Rings
### Aliases: plotRings
### Keywords: hplot

### ** Examples

# with tree-ring series from Rothenburg data
data("anos1")

yrs <- time(anos1)
# Plot rings with data of two radii from same individual tree
res <- plotRings(yrs, anos1[,4], trwW = anos1[,5],
                 species.name = "Cedrela odorata")

# change plot limits                 
res <- plotRings(yrs, anos1[,4], trwW = anos1[,5], 
                 xy.lim = 100)

# Playing with colors
res <- plotRings(yrs, anos1[,4], trwW = anos1[,5],
                 col.inrings = "tan", col.outring = "blue") 
res <- plotRings(yrs, anos1[,4], trwW = anos1[,5],
                 col.inrings = terrain.colors(nrow(anos1))) 

#Setting the length.unit
res <- plotRings(yrs,  anos1[,4], trwW = anos1[,5],sp="Cedrela odorata",
                 length.unit = "mm")
res <- plotRings(yrs,  anos1[,4], trwW = anos1[,5],sp="Cedrela odorata",
                 length.unit = "1/100 mm")

# Specifying x.rings highlighting only narrow rings
res <- plotRings(yrs, anos1[,4], trwW = anos1[,5],
                 x.rings = "narrow.rings") 

# Highlight and color wide rings
res <- plotRings(yrs, anos1[,4], trwW = anos1[,5],
                 x.rings = "wider.rings", col.x.rings = "green") 

## Not run: 
##D # Plot rings and animate. Requires ImageMagick to be installed.
##D res <- plotRings(yrs, anos1[,4], trwW = anos1[,5],year.labels = TRUE, 
##D                  animation = TRUE, sys.sleep = 0.1)
##D                  
##D # Plot rings, animate, save as GIF. Requires ImageMagick to be installed.
##D res <- plotRings(yrs, anos1[,4], trwW = anos1[,5],
##D                  saveGIF = TRUE, fname="GIF_plotRings.gif",sys.sleep = 0.1)
## End(Not run)

# with four fake tree-ring series 
trw <- data.frame(trw01.n = abs(rnorm(100, 10, 4)),  # North direction
                  trw01.s = abs(rnorm(100, 10, 2)),  # South direction
                  trw01.w = abs(rnorm(100, 10, 2)),  # West direction
                  trw01.e = abs(rnorm(100, 10, 2)),  # East direction
                  row.names = 1918:2017)
class(trw) <- c("rwl","data.frame")

yrs <- time(trw)

# Default plot with 2, 3 and 4 radii
res <- plotRings(yrs, trw[,1], trw[,2], trw[,3], trw[,4])

# with d2pith values (see the hole before the first rings in the plot)
res <- plotRings(yrs, trw[,1], trw[,2], trw[,3], trw[,4],
                 d2pith = 100)




