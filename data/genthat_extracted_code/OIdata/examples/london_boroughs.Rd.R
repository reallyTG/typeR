library(OIdata)


### Name: london_boroughs
### Title: London Borough Boundaries
### Aliases: london_boroughs
### Keywords: datasets London map borough

### ** Examples

data(london_boroughs)
## Not run: 
##D # install.packages("ggplot2")
##D # install.packages("RColorBrewer")
##D library(ggplot2)
##D library(RColorBrewer)
##D data(murders)
##D LB          <- london_boroughs
##D mtab        <- table(murders$borough)
##D LB$nmurders <- rep(mtab, rle(as.character(LB$name))$lengths)
##D p           <- ggplot()
##D p +
##D   geom_polygon(data=LB, aes(x=x, y=y, group = name, fill = nmurders),
##D                colour="white" ) +
##D   scale_fill_gradientn(colours = brewer.pal(7, "Blues"),
##D                limits=range(LB$nmurders))
## End(Not run)



