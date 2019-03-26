library(robCompositions)


### Name: mortality
### Title: mortality and life expectancy in the EU
### Aliases: mortality
### Keywords: data

### ** Examples


data(mortality)
str(mortality)
## totals (mortality)
aggregate(mortality[,5:ncol(mortality)], 
          list(mortality$country2), sum)



