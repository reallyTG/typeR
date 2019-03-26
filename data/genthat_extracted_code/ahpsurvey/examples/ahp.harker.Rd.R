library(ahpsurvey)


### Name: ahp.harker
### Title: Replace inconsistent pairwise comparisons
### Aliases: ahp.harker

### ** Examples


atts <- c('cult', 'fam', 'house', 'jobs', 'trans')

data(city200)

cityahp <- ahp.mat(city200, atts, negconvert = TRUE)
ahp.harker(cityahp, atts)




