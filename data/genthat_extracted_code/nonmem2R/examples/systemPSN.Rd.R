library(nonmem2R)


### Name: systemPSN
### Title: Run qpsn system call
### Aliases: systemPSN

### ** Examples

# (if the platform has who)
try(systemPSN("who", intern = TRUE))

try(systemPSN("ls fizzlipuzzli", intern = TRUE, ignore.stderr = TRUE))
# zero-length result since file does not exist, and will give warning.



