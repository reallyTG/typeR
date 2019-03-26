library(datadr)


### Name: convert
### Title: Convert 'ddo' / 'ddf' Objects
### Aliases: convert

### ** Examples

d <- divide(iris, by = "Species")
# convert in-memory ddf to one stored on disk
dl <- convert(d, localDiskConn(tempfile(), autoYes = TRUE))
dl



