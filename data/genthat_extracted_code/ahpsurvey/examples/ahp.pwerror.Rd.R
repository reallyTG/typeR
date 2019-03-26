library(ahpsurvey)


### Name: ahp.pwerror
### Title: Finds the pairwise comparisons with the maximum amount of
###   inconsistency
### Aliases: ahp.pwerror

### ** Examples


library(magrittr)

atts <- c('cult', 'fam', 'house', 'jobs', 'trans')

data(city200)

cityahp <- ahp.mat(city200, atts, negconvert = TRUE)
ahp.error(cityahp, atts)





