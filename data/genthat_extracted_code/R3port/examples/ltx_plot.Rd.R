library(R3port)


### Name: ltx_plot
### Title: Prints a R plot to a latex file or console
### Aliases: ltx_plot

### ** Examples


# It is convenient to have an object for the plot argument
## Not run: 
##D   data(Theoph)
##D   library(ggplot2)
##D   pl <- qplot(Time, conc, data=Theoph, facets=~Subject,geom="line")
##D   ltx_plot(pl,out=tempfile(fileext=".tex"))
##D 
##D   # Base plots work a bit different and can be placed
##D   # in the function directly or wrapped in a function
##D   pl <- function() {
##D     plot(conc~Time,data=Theoph)
##D     title(main="a plot")
##D   }
##D   ltx_plot(pl(),out=tempfile(fileext=".tex"))
##D   # In case of big data it can be more convenient to have a png included
##D   ltx_plot(plot(rnorm(1e6)),out=tempfile(fileext=".tex"),
##D            outfmt="png",pwidth=2000,pheight=1200)
## End(Not run)



