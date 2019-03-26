library(ahpsurvey)


### Name: ahp.aggjudge
### Title: Aggregate individual judgments
### Aliases: ahp.aggjudge

### ** Examples


## Computes individual judgments with geometric mean and aggregates them
## with a trimmed arithmetic mean

data(city200)
atts <- c('cult', 'fam', 'house', 'jobs', 'trans')

cityahp <- ahp.mat(df = city200, atts = atts, negconvert = TRUE)
ahp.aggjudge(cityahp, atts, aggmethod = 'tmean', qt = 0.1)





