library(SASxport)


### Name: toSAS.default
### Title: Convert R Data Object for Storage in a SAS XPORT File
### Aliases: toSAS toSAS.numeric toSAS.logical toSAS.character toSAS.factor
###   toSAS.POSIXt toSAS.Date toSAS.default
### Keywords: manip IO

### ** Examples


####
## See how an R date/time object will be stored in a SAS xport file:
####

# Date and time
dateTimeObj <- ISOdate(2007,08,01,10,14,37)
class(dateTimeObj)
dateTimeObj

sasDateTimeObj <- toSAS(dateTimeObj)
sasDateTimeObj

# Now just the date portion
dateObj <- as.Date(dateTimeObj)
dateObj

sasDateObj <- toSAS(dateObj)
sasDateObj

####
## Create a new R object class based on factor to hold color names
####
colorFactor <- function(x) # constructor
  {
    retval <- factor(x, levels=c("Red","Green","Blue") )
    class(retval) <- c("colorFactor","factor")
    retval
  }

## create one and look at it
cf <- colorFactor( c("Red","Red","Blue",NA) )
cf

## See how it will be represented in a SAS xport file
toSAS(cf)

## Create a new conversion function to store as a RGB hex value
toSAS.colorFactor <- function(x, format="")
{
   retval <- ifelse(x=="Red", "#FF0000",
                    ifelse(x=="Green", "#00FF00", "#0000FF") )
   attr(retval, "SASformat") <- format
   retval
}

## see it in action
toSAS(cf)




