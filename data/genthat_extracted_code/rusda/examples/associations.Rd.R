library(rusda)


### Name: associations
### Title: Downloads associations for input species from SMML Fungus-Host
###   DB
### Aliases: associations

### ** Examples

## Not run: 
##D ## Example for species name(s) as input
##D x <- "Fagus sylvatica"
##D pathogens <- associations(x, database = "both", clean = TRUE, syn_include = TRUE,
##D spec_type = "plant", process = TRUE)
##D x <- "Rosellinia ligniaria"
##D hosts <- associations(x, database = "both", clean = TRUE, syn_include = TRUE,
##D spec_type = "fungus", process = TRUE)
##D is.element("Rosellinia ligniaria", pathogens$association[[1]])
##D is.element("Fagus sylvatica", hosts$association[[1]])
##D 
##D ## Example for genus/genera name(s) as input
##D x <- "Zehneria"
##D # or
##D x <- c("Zehneria", "Momordica")
##D hosts <- associations(x, database = "both", clean = TRUE, syn_include = TRUE,
##D spec_type = "plant", process = TRUE)
## End(Not run)



