library(humanFormat)


### Name: formatBytes
### Title: Format a number of bytes into a human readable string.
### Aliases: formatBytes formatSIBytes formatIECBytes

### ** Examples

  # returns "934.82MB"
  formatBytes(934818582)

  # returns "891.51MiB"
  formatIECBytes(934818582)

  # returns c("8.43KB", "3.52KB", "624.62KB", "46", "7.36KB")
  formatBytes(c(8429, 3525, 624624, 46, 7357))



