library(R3port)


### Name: html_combine
### Title: Combines multiple HTML files to a single tex and compiles
###   document
### Aliases: html_combine

### ** Examples


# Take into account the usage of tempfile() with multiple function calls
data(Theoph)
html_list(Theoph[1:11,],out=tempfile(fileext=".html"),show=FALSE)
html_plot(plot(conc~Time,data=Theoph),out=tempfile(fileext=".html"),show=FALSE)
## Not run: 
##D   html_combine(combine=tempdir(),out="rep1.html")
##D 
##D   # toctheme can be used to have a clickable toc,
##D   # a bootstrap template for this is provided in the package
##D   html_combine(combine=tempdir(),out="rep1.html",
##D               template=paste0(system.file(package="R3port"),"/bootstrap.html"),
##D               toctheme=TRUE)
##D  
## End(Not run)



