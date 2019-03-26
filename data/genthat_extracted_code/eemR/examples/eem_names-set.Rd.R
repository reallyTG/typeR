library(eemR)


### Name: eem_names<-
### Title: Set the sample names of an eem or eemlist objects
### Aliases: eem_names<-

### ** Examples

folder <- system.file("extdata/cary/scans_day_1", package = "eemR")
eems <- eem_read(folder)

eem_names(eems)
eem_names(eems) <- c("a", "b", "c", "d")
eem_names(eems)




