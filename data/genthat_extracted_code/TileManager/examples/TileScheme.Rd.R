library(TileManager)


### Name: TileScheme
### Title: Tile Scheme
### Aliases: TileScheme

### ** Examples

# Create an irregularly shaped grid defined by the number of raster cells
ts1 <- TileScheme(CHMdemo, dimByCell = c(100,120))

# Create an square shaped grid defined by unit distance (m)
ts2 <- TileScheme(CHMdemo, dimByDist = c(50,50))

# Create a grid with buffered cells
ts3 <- TileScheme(CHMdemo, dimByDist = c(50,50), buffer = 5)



