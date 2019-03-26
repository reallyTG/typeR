library(jubilee)


### Name: jubilee.read_fred_file
### Title: Internal utility to read FRED file
### Aliases: jubilee.read_fred_file
### Keywords: data

### ** Examples

  repo <- jubilee.repo(online=FALSE)
  a <- jubilee.read_fred_file(repo@ie$fraction, "BAA.csv", "BAA")
  tail(a)




