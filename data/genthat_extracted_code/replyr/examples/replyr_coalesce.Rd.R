library(replyr)


### Name: replyr_coalesce
### Title: Augment a data frame by adding additional rows.
### Aliases: replyr_coalesce

### ** Examples



# single column key example
data <- data.frame(year = c(2005,2007,2010),
                   count = c(6,1,NA),
                   name = c('a','b','c'),
                   stringsAsFactors = FALSE)
support <- data.frame(year=2005:2010)
filled <- replyr_coalesce(data, support,
                          fills=list(count=0))
filled <- filled[order(filled$year), ]
filled

# complex key example
data <- data.frame(year = c(2005,2007,2010),
                   count = c(6,1,NA),
                   name = c('a','b','c'),
                   stringsAsFactors = FALSE)
support <- expand.grid(year=2005:2010,
                   name= c('a','b','c','d'),
                   stringsAsFactors = FALSE)
filled <- replyr_coalesce(data, support,
                          fills=list(count=0))
filled <- filled[order(filled$year, filled$name), ]
filled




