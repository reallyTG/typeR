library(ahpsurvey)


### Name: ahp.indpref
### Title: Computes priority weights of individual decision-makers
### Aliases: ahp.indpref

### ** Examples


data(city200)
atts <- c('cult', 'fam', 'house', 'jobs', 'trans')

cityahp <- ahp.mat(df = city200, atts = atts, negconvert = TRUE) 
ahp.indpref(cityahp, atts, method = "eigen")




