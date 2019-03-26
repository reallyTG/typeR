library(siplab)


### Name: kernel
### Title: Competition Kernel Functions
### Aliases: kernel powers.ker spurr.ker staebler.ker

### ** Examples

# Originally Hegyi added one foot to the distance:
hegyi.orig <- function(imarks, jmarks, dists, dranks, par) {
# Assume coordinates in meters, and that dbh is labeled 'dbh'
    (jmarks$dbh / imarks$dbh) / (dists + 0.30481)
}



