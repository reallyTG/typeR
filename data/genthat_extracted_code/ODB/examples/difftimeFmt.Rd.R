library(ODB)


### Name: difftimeFmt
### Title: Formats a time difference in multiple units
### Aliases: difftimeFmt

### ** Examples

  # Full format
  difftimeFmt(94521.125846)
  
  # With dates
  T1 <- strptime("2011-03-21 14:32:03", format="%Y-%m-%d %H:%M:%S")
  T2 <- strptime("2011-08-06 18:14:21", format="%Y-%m-%d %H:%M:%S")
  dT <- as.double(difftime(T2, T1, units="secs"))
  difftimeFmt(dT)



