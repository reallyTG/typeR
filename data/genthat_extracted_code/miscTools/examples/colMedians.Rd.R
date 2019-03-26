library(miscTools)


### Name: colMedians
### Title: Medians of Columns
### Aliases: colMedians
### Keywords: array

### ** Examples

   data( "Electricity", package = "Ecdat" )
   colMedians( Electricity )

   a4 <- array( 1:120, dim = c(5,4,3,2),
      dimnames = list( c("a","b","c","d","e"), c("A","B","C","D"),
      c("x","y","z"), c("Y","Z") ) )
   colMedians( a4 )
   median( a4[ , "B", "x", "Z" ] )  # equal to
   colMedians( a4 )[ "B", "x", "Z" ]



