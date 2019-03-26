library(R3port)


### Name: html_plot
### Title: Prints a R plot to a HTML file or console
### Aliases: html_plot

### ** Examples


# It is convenient to have an object for the plot argument
## Not run: 
##D 
##D   data(Theoph)
##D   library(ggplo2)
##D   pl <- qplot(Time, conc, data=Theoph, facets=~Subject,geom="line")
##D   html_plot(pl,out=paste0(tempfile(),".html"))
##D 
##D   # Base plots work a bit different and can be placed
##D   # in the function directly or wrapped in a function
##D   html_plot(plot(conc~Time,data=Theoph),out=tempfile(fileext=".html"))
##D   pl <- function() {
##D     plot(conc~Time,data=Theoph)
##D     title(main="a plot")
##D   }
##D   html_plot(pl(),out=tempfile(fileext=".html"))
## End(Not run)



