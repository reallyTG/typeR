library(sig)


### Name: write_sigs
### Title: Write sigs to file
### Aliases: write_sigs write_sigs.character write_sigs.default
###   write_sigs.environment write_sigs.siglist

### ** Examples

#Step by step:
#First, list some sigs.
utils_sigs <- list_sigs(pkg2env(utils))
#Without a file argument, sigs are just printed to the console.
head(write_sigs(utils_sigs))
#Write to a file
tmpf <- tempfile("sig", fileext = ".R")
write_sigs(utils_sigs, tmpf)
## Not run: 
##D Open the file we've just written
##D shell(tmpf, wait = FALSE)
## End(Not run)
#Can also list and write in one line.
tmpf2 <- tempfile("sig", fileext = ".R")
write_sigs(pkg2env(grDevices), tmpf2)
#Single sigs are coerced to siglists
write_sigs(sig(stats::var))



