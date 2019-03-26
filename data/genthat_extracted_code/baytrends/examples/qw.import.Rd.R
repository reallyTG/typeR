library(baytrends)


### Name: qw.import
### Title: qw.import
### Aliases: qw.import

### ** Examples

# Use internal function to export dataCensored as example for import
qw.export(dataCensored, getwd(), "dataCensored_TEST.csv")


# Import Test file as a qw object

# Define function parameters
fn.import <- file.path(".", "dataCensored_TEST.csv")
qw.names <- c("secchi", "chla", "do", "tn", "tp", "po4", "tdp"
              , "no23", "nh4", "tdn", "tss")
rounding <- c(3, 4)

# Import
dataCensored.test<- qw.import(fn.import, qw.names, rounding)

# Check for qw class
str(dataCensored.test)

# Save
save(dataCensored.test, file="dataCensored.test.rda")


# Show slot names for a qw object.
slotNames("qw")

####
# convert date field to POSIXct
#dataCensored.test[,"date"] <- as.POSIXct(dataCensored.test[,"date"])
# str(dataCensored.test)
# as.numeric() and as.integer() can be used to convert columns of those types.



