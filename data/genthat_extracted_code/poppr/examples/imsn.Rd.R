library(poppr)


### Name: imsn
### Title: Create minimum spanning networks interactively
### Aliases: imsn

### ** Examples

## Not run: 
##D 
##D # Set up some data
##D library("poppr")
##D library("magrittr")
##D data(monpop)
##D splitStrata(monpop) <- ~Tree/Year/Symptom
##D summary(monpop)
##D monpop_ssr <- c(CHMFc4 = 7, CHMFc5 = 2, CHMFc12 = 4, 
##D                 SEA = 4, SED = 4, SEE = 2, SEG = 6, 
##D                 SEI = 3, SEL = 4, SEN = 2, SEP = 4, 
##D                 SEQ = 2, SER = 4)
##D t26 <- monpop %>% setPop(~Tree) %>% popsub("26") %>% setPop(~Year/Symptom)
##D t26
##D imsn() # select Bruvo's distance and enter "monpop_ssr" into the Repeat Length field.
##D 
##D # It is also possible to run this from github if you are connected to the internet.
##D # This allows you to access any bug fixes that may have been updated before a formal
##D # release on CRAN
##D 
##D shiny::runGitHub("grunwaldlab/poppr", subdir = "inst/shiny/msn_explorer")
##D 
##D # You can also use your own distance matrices, but there's a small catch.
##D # in order to do so, you must write a function that will subset the matrix
##D # to whatever populations are in your data. Here's an example with the above
##D # data set:
##D 
##D mondist <- bruvo.dist(monpop, replen = monpop_ssr)
##D myDist <- function(x, d = mondist){
##D  dm <- as.matrix(d)          # Convert the dist object to a square matrix
##D  xi <- indNames(x)           # Grab the sample names that exist
##D  return(as.dist(dm[xi, xi])) # return only the elements that have the names
##D                              # in the data set
##D }
##D # After executing imsn, choose:
##D # Distance: custom
##D # myDist
##D imsn() 
## End(Not run)



