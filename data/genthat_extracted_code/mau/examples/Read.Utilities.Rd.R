library(mau)


### Name: Read.Utilities
### Title: Read utilities
### Aliases: Read.Utilities

### ** Examples

library( data.table )
file<-system.file("extdata", "utilities.txt", package = "mau" )
script<-'utilities.R'
lines<-17
skip<-2
encoding<-'utf-8'
functions<-Read.Utilities( file, script, lines, skip, encoding )



