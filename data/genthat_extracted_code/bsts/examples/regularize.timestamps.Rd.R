library(bsts)


### Name: regularize.timestamps
### Title: Produce a Regular Series of Time Stamps
### Aliases: RegularizeTimestamps RegularizeTimestamps.default
###   RegularizeTimestamps.numeric RegularizeTimestamps.Date
###   RegularizeTimestamps.POSIXt
### Keywords: chron

### ** Examples

  library(bsts)
  first <- as.POSIXct("2015-04-19 08:00:04")
  monthly <- seq(from = first, length.out = 24, by = "month")
  skip.one <- monthly[-8]
  has.duplicates <- monthly
  has.duplicates[2] <- has.duplicates[3]

  reg1 <- RegularizeTimestamps(skip.one)
  all.equal(reg1, monthly) ## TRUE

  reg2 <- RegularizeTimestamps(has.duplicates)
  all.equal(reg2, monthly)  ## TRUE




