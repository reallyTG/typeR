library(SASxport)


### Name: SASformat
### Title: Set or Retreive the 'label', 'SASformat', 'SASiformat', or
###   'SAStype' attribute of a vector or (components of) a data frame
### Aliases: SASformat SASformat.default SASformat<- SASformat<-.default
###   SASiformat SASiformat.default SASiformat<- SASiformat<-.default
###   SAStype SAStype.default SAStype<- SAStype<-.default
### Keywords: utilities interface

### ** Examples


## Examples for vectors

fail.time <- c(10,20)

# set attributes
SASformat(fail.time) <- 'Numeric2'
SASiformat(fail.time) <- 'Numeric2'

# display individual attributes
SASformat(fail.time)
SASiformat(fail.time)

# display all attributes
attributes(fail.time)

## SAStype only applies to data frames
df <- data.frame( fail.time, day=c("Mon","Tue") )
SAStype(df) <- "USER"

SAStype(df)

## Example showing specification of default return value
a <- 70
label(a, default="no label")



