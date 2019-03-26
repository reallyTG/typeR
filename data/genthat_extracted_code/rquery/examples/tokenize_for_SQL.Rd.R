library(rquery)


### Name: tokenize_for_SQL
### Title: Cross-parse from an R parse tree into SQL.
### Aliases: tokenize_for_SQL

### ** Examples


tokenize_for_SQL(substitute(1 + 2), colnames= NULL)
tokenize_for_SQL(substitute(a := 3), colnames= NULL)
tokenize_for_SQL(substitute(a %:=% ( 3 + 4 )), colnames= NULL)
tokenize_for_SQL(substitute(a %:=% rank(3, 4)), colnames= NULL)




