library(eemR)


### Name: print.eemlist
### Title: Display summary of an eemlist object
### Aliases: print.eemlist

### ** Examples

folder <- system.file("extdata/cary", package = "eemR")
eem <- eem_read(folder, recursive = TRUE)

print(eem)



