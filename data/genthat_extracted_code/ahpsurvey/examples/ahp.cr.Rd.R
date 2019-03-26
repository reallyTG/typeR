library(ahpsurvey)


### Name: ahp.cr
### Title: Calculates the consistency ratio of each decision-maker
### Aliases: ahp.cr

### ** Examples


data(city200)
atts <- c('cult', 'fam', 'house', 'jobs', 'trans')

cityahp <- ahp.mat(df = city200, atts = atts, negconvert = TRUE) 
ahp.cr(cityahp, atts)




