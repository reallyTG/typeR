library(pivot)


### Name: pivot
### Title: Pivot a table
### Aliases: pivot

### ** Examples

library(dplyr)
library(dbplyr)
# establish db as a database connection
## Don't show: 
   con <- simulate_mssql()
   src <- src_dbi(con)
   base <- list( x = ident('##iris')
               , vars  = tbl_vars(iris)
               ) %>% structure(class=c('op_base_remote', 'op_base', 'op'))
   db_iris <- structure( list( src = src
                             , ops = base
                             )
       , class = c('tbl_dbi', 'tbl_sql', 'tbl_lazy', 'tbl'))
## End(Don't show)
## Not run: 
##D db_iris <- copy_to(db, iris)
## End(Not run)
result <- pivot( db_iris, Species, mean(Petal.Length, na.rm=TRUE)
               , setosa, versicolor, virginica)
sql_render(result)




