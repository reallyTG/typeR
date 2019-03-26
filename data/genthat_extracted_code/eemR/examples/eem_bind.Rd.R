library(eemR)


### Name: eem_bind
### Title: Bind eem or eemlist
### Aliases: eem_bind

### ** Examples

file <- system.file("extdata/cary/scans_day_1/", "sample1.csv", package = "eemR")
eem <- eem_read(file)

eem <- eem_bind(eem, eem)



