library(RWeka)


### Name: Weka_associators
### Title: R/Weka Associators
### Aliases: Apriori Tertius
### Keywords: models

### ** Examples

x <- read.arff(system.file("arff", "contact-lenses.arff",
                           package = "RWeka"))
## Apriori with defaults.
Apriori(x)
## Some options: set required number of rules to 20.
Apriori(x, Weka_control(N = 20))

## Not run: 
##D ## Requires Weka package 'tertius' to be installed.
##D ## Tertius with defaults.
##D Tertius(x)
##D ## Some options: only classification rules (single item in the RHS).
##D 
##D Tertius(x, Weka_control(S = TRUE))
## End(Not run)



