library(qlcVisualize)


### Name: limage
### Title: Drawing multi-level images for visualisation of nominal data
###   with various levels.
### Aliases: limage levelimage

### ** Examples

# a simple data matrix
x <- matrix(letters[1:5],3,5)
x[2,3] <- x[1,4] <- NA
rownames(x) <- c("one", "two", "three")
colnames(x) <- 1:5
x

# some basic level-images
limage(x)
limage(x, col = heat.colors(5), asp = NA)
limage(x, col = list(b="red",e="blue"), show.remaining = TRUE)

## Not run: 
##D # more interesting example, different "f" sounds in german dialects
##D # note that fonts might be problematic on some platforms
##D # plotting window should be made really large as well
##D data(dialects)
##D limage(dialects$data, col = rainbow(8), order = "R2E"
##D     , cex.axis = 0.3, cex.legend = 0.7
##D     , show.remaining = T, cex.remaining = 0.2)
##D 
##D # get reordering of rows
##D # to identify the group of words with "p-f" correspondences
##D limage(dialects$data, order = "R2E", plot = FALSE)
## End(Not run)



