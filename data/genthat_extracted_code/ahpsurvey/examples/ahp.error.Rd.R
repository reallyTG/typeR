library(ahpsurvey)


### Name: ahp.error
### Title: Matrix of the product between the pairwise comparison value and
###   pj/pi
### Aliases: ahp.error

### ** Examples



atts <- c('cult', 'fam', 'house', 'jobs', 'trans')

data(city200)

cityahp <-  ahp.mat(city200, atts, negconvert = TRUE)
ahp.error(cityahp, atts)





