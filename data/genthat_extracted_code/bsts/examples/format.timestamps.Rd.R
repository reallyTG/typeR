library(bsts)


### Name: format.timestamps
### Title: Checking for Regularity
### Aliases: NoDuplicates NoGaps IsRegular HasDuplicateTimestamps
### Keywords: chron

### ** Examples

  first <- as.POSIXct("2015-04-19 08:00:04")
  monthly <- seq(from = first, length.out = 24, by = "month")
  IsRegular(monthly) ## TRUE

  skip.one <- monthly[-8]
  IsRegular(skip.one) ## FALSE

  has.duplicates <- monthly
  has.duplicates[1] <- has.duplicates[2]
  IsRegular(has.duplicates) ## FALSE



