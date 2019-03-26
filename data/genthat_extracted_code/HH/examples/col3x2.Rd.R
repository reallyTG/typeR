library(HH)


### Name: col3x2
### Title: col3x2 color dataset
### Aliases: col3x2
### Keywords: datasets

### ** Examples

data(col3x2)
## Not run: 
##D library(RColorBrewer)
##D library(grid)
##D library(lattice)
##D col3x2 <- c(brewer.pal(n=3, "Dark2"), brewer.pal(n=3, "Set2"))
##D save(col3x2, file="col3x2.rda")
##D ##
##D grid.newpage()
##D draw.key(list(text=list(c("Dark2", "Set2")),
##D               rectangles=list(col=col3x2[c(1,4,2,5,3,6)],
##D                               cex=1.5, size=8, height=.7, border=FALSE),
##D               columns=3,
##D               between=1,
##D               padding.text=8),
##D          draw=TRUE)
## End(Not run)



