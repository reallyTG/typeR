library(chron)


### Name: format.chron
### Title: Format a chron object
### Aliases: format.chron
### Keywords: misc

### ** Examples

format(chron(0, 0), c("yy/m/d", "h:m:s"), sep = "T", enclose = c("", ""))
format(chron(0, 0), "%Y-%m-%dT%H:%M:%S") # same



