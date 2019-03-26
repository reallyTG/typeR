library(pivot)


### Name: pivot_query
### Title: Create a pivot query representation
### Aliases: pivot_query

### ** Examples

library(dplyr)
library(dbplyr)
con <- simulate_mssql()

query <- pivot_query( ident('##iris'), key = ident('Species')
                    , levels = ident(c('setosa', 'virginica', 'versicolor'))
                    , value  = rlang::quo(mean(Petal.Length, na.rm=TRUE))
                    )
sql_render(query, con=con)



