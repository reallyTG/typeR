library(SASxport)


### Name: write.xport
### Title: Write Data to a SAS XPORT File
### Aliases: write.xport
### Keywords: file

### ** Examples


#####
## R version of the example given in TS-140
#####

## manually create a data set
abc <- data.frame( x=c(1, 2, NA, NA ), y=c('a', 'B', NA, '*' ) )

## look at it
abc

## add a format specifier (not used by R)
SASformat(abc$x) <- 'date7.'

## add a variable label (not used by R)
label(abc$y) <- 'character variable'

## add a dataset label and type
label(abc) <- 'Simple example'
SAStype(abc) <- 'MYTYPE'

## verify the additions
str(abc)

# create a SAS XPORT file
tmp <- tempfile(fileext = ".dat")
write.xport( abc, file = tmp )

# list the contents of the file
lookup.xport(tmp)

## reload the data
xxx.abc <- read.xport(tmp)

## and look at it
xxx.abc

## Check the label and type
label(xxx.abc)
SAStype(xxx.abc)

## Note that the variable names and SAS dataset type have been converted
## to uppercase




