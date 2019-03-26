library(bfw)


### Name: TidyCode
### Title: Tidy Code
### Aliases: TidyCode

### ** Examples

messy <- "code <- function( x ) {
print (x ) }"
cat(messy)
code <- function( x ) {
print (x ) }
cat ( TidyCode(messy, jags = FALSE) )
code <- function(x) {
   print(x)
}



