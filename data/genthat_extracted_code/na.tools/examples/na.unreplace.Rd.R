library(na.tools)


### Name: na.unreplace
### Title: na.unreplace
### Aliases: na.unreplace na.unreplace.default na.unreplace.character
###   na.unreplace.factor na.implicit

### ** Examples


 na.unreplace( c(1,2,3,4), 3 )
 na.unreplace( c("A", "(NA)", "B", "C") )
 na.unreplace( c("A", NA_explicit_, "B", "C") )
 
 df <- data.frame( char=c('A', 'NA', 'C', NA_explicit_), num=1:4 ) 
 na.unreplace(df)
 
 



