library(caroline)


### Name: bestBy
### Title: Find the "best" record within subgroups of a dataframe.
### Aliases: bestBy

### ** Examples


blast.results <- data.frame(score=c(1,2,34,4,5,3,23), 
                            query=c('z','x','y','z','x','y','z'), 
                            target=c('a','b','c','d','e','f','g')
                            )
best.hits.R <- bestBy(blast.results, by='query', best='score', inverse=TRUE)
best.hits.R
## or using SQLite
best.hits.sql <- bestBy(blast.results, by='query', best='score', inverse=TRUE, sql=TRUE)
best.hits.sql




