library(mssqlR)


### Name: select
### Title: Generates Select part fo the query
### Aliases: select
### Keywords: from

### ** Examples


#Returns Top 100 rows
from_tb <- select("","COl1","COl2","Col3", top=100)

#Returns distinct rows
from_tb <- select("","COl1","COl2","Col3", distinct=TRUE)



