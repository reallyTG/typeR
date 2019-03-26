library(pivot)


### Name: sql_pivot
### Title: Create a Pivot Query
### Aliases: sql_pivot

### ** Examples

library(dbplyr)
query <- sql_pivot( dbplyr::simulate_mssql()
                  , from   = ident('##iris')
                  , select = ident()
                  , key    = ident('Species')
                  , value  = rlang::quo(mean(Petal.Length, na.rm=TRUE))
                  , levels = ident(c('versicolor', 'virginica'))
                  )
sql_render(query)



