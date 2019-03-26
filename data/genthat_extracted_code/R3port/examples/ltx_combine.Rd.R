library(R3port)


### Name: ltx_combine
### Title: Combines multiple latex files to a single tex and compiles
###   document
### Aliases: ltx_combine

### ** Examples


# Take into account the usage of tempfile() with multiple function calls
data(Theoph)
ltx_list(Theoph[1:11,],out=tempfile(fileext=".tex"),show=FALSE)
ltx_plot(plot(conc~Time,data=Theoph),out=tempfile(fileext=".tex"),show=FALSE)
## Not run: 
##D   ltx_combine(combine=tempdir(),out="rep1.tex")
##D 
##D   # possibility for presentation layout (beamer template provided in package)
##D   ltx_combine(combine=tempdir(),out="rep1.tex",
##D               template=paste0(system.file(package="R3port"),"/beamer.tex"),
##D               presentation=TRUE)
##D 
##D   # Or other template with different orientation
##D   ltx_combine(combine=tempdir(),out="rep1.tex",
##D               template=paste0(system.file(package="R3port"),"/listing.tex"),
##D               orientation="portrait")
## End(Not run)



