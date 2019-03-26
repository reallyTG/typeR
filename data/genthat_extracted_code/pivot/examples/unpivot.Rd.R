library(pivot)


### Name: unpivot
### Title: Un-pivot a table
### Aliases: unpivot

### ** Examples

# establish `db` as a database connection

library(dplyr)
library(dbplyr)
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
##D     db_iris <- copy_to(db, iris)
## End(Not run)
long.iris <- unpivot(db_iris, Variable, Value, Sepal.Length, Sepal.Width, Petal.Length, Petal.Width)
sql_render(long.iris)





