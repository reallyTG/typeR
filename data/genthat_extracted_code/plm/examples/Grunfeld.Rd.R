library(plm)


### Name: Grunfeld
### Title: Grunfeld's Investment Data
### Aliases: Grunfeld
### Keywords: datasets

### ** Examples

## Not run: 
##D # Compare plm's Grunfeld data to Baltagi's (2001) Grunfeld data:
##D   data("Grunfeld"", package="plm")
##D   Grunfeld_baltagi2001 <- read.csv("http://www.wiley.com/legacy/wileychi/
##D     baltagi/supp/Grunfeld.fil", sep="", header = FALSE)
##D   library(compare)
##D   compare::compare(Grunfeld, Grunfeld_baltagi2001, allowAll = T) # same data set
##D   
## End(Not run)



