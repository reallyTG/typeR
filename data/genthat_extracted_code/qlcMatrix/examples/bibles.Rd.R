library(qlcMatrix)


### Name: bibles
### Title: A selection of bible-texts
### Aliases: bibles
### Keywords: datasets

### ** Examples

# ----- load data -----

data(bibles)

# ----- separate into sparse matrices -----

# use splitText to turn a bible into a sparse matrix of wordforms x verses
E <- splitText(bibles$eng, simplify = TRUE, lowercase = FALSE)

# all wordforms from the first verse
# (internally using pure Unicode collation, i.e. ordering is determined by Unicode numbering)
which(E[,1] > 0)

# ----- co-occurrence across text -----

# how often do 'father' and 'mother' co-occur in one verse?
# (ignore warnings of chisq.test, because we are not interested in p-values here)

( cooc <- table(E["father",] > 0, E["mother",] > 0) )
suppressWarnings( chisq.test(cooc)$residuals )

# the function 'sim.words' does such computations efficiently 
# for all 15000 x 15000 pairs of words at the same time

## Not run: 
##D system.time( sim <- sim.words(bibles$eng, lowercase = FALSE) )
##D sim["father", "mother"]
##D   
## End(Not run)



