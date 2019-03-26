library(qdap)


### Name: syllable_sum
### Title: Syllabication
### Aliases: syllable_sum syllable_count polysyllable_sum
###   combo_syllable_sum
### Keywords: polysyllable syllabication, syllable,

### ** Examples

## Not run: 
##D syllable_count("Robots like Dason lie.")
##D syllable_count("Robots like Dason lie.", algorithm.report = TRUE)
##D 
##D syllable_sum(DATA$state)
##D x1 <- syllable_sum(rajSPLIT$dialogue)
##D plot(x1)
##D cumulative(x1)
##D 
##D polysyllable_sum(DATA$state)
##D x2 <- polysyllable_sum(rajSPLIT$dialogue)
##D plot(x2)
##D cumulative(x2)
##D 
##D combo_syllable_sum(DATA$state)
##D x3 <- combo_syllable_sum(rajSPLIT$dialogue)
##D plot(x3) 
##D cumulative(x3)
## End(Not run)



