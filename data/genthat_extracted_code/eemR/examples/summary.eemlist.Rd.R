library(eemR)


### Name: summary.eemlist
### Title: Display summary of an eemlist object
### Aliases: summary.eemlist

### ** Examples

folder <- system.file("extdata/cary", package = "eemR")
eem <- eem_read(folder, recursive = TRUE)

summary(eem)



