library(ahpsurvey)


### Name: ahp.mat
### Title: Generate AHP pairwise matrices from survey data
### Aliases: ahp.mat

### ** Examples



data(city200)
atts <- c('cult', 'fam', 'house', 'jobs', 'trans')
ahp.mat(df = city200, atts = atts, negconvert = TRUE)




