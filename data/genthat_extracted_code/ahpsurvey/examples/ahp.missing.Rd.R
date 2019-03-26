library(ahpsurvey)


### Name: ahp.missing
### Title: Impute missing observations using the method in Harker (1987)
### Aliases: ahp.missing

### ** Examples


library(magrittr)

atts <- c('cult', 'fam', 'house', 'jobs', 'trans')

data(city200)

set.seed(42)
## Make a dataframe that is missing at random
missing.df <- city200[1:10,]
for (i in 1:10){
  missing.df[i, round(stats::runif(1,1,10))] <- NA
}
missingahp <- ahp.mat(missing.df, atts, negconvert = TRUE)
ahp.missing(missingahp, atts)




