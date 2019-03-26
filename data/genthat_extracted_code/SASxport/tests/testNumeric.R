library(SASxport)
Sys.setenv("TZ"="GMT")

##
## Construct a data frame with all common R data types.
## For each, include NA, min, max, and 3 sample values
##

ints <- as.integer  ( c(NA, .Machine$integer.max, -.Machine$integer.max, -123456,  0, +123456 ) )
dbls <- as.numeric  ( c(NA, .Machine$double.xmin, .Machine$double.xmax,  -123.456, 0, +123.456) )
char <- as.character( c(NA, '', paste(letters,LETTERS,sep="",collapse=''), '-123456', '', '+123456') )
factor <- factor    ( c(NA, '', 'Z', 'AA', '', 'ZZ' ) )

# this gets properly handled
df <- data.frame(ints, dbls, char, factor) 
write.xport(df, file='testNumeric.xpt')
df.2 <- read.xport(file='testNumeric.xpt')

stopifnot( all(df == df.2, na.rm=TRUE) )
df.2

# this gets properly handled
df <- data.frame(ints, dbls, char, factor, stringsAsFactors=FALSE) 
write.xport(df, file='testNumeric.xpt')
df.2 <- read.xport(file='testNumeric.xpt')


stopifnot(all(df==df.2,na.rm=TRUE))
df.2

