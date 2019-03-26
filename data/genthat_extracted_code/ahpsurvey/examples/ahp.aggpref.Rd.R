library(ahpsurvey)


### Name: ahp.aggpref
### Title: Aggregate priority weights
### Aliases: ahp.aggpref

### ** Examples


## Computes individual priorities with geometric mean and aggregates them
## with a trimmed arithmetic mean

library(magrittr)

data(city200)
atts <- c('cult', 'fam', 'house', 'jobs', 'trans')

cityahp <- ahp.mat(df = city200, atts = atts, negconvert = TRUE)
ahp.aggpref(cityahp, atts, method = 'geometric', aggmethod = 'tmean', qt = 0.1)




