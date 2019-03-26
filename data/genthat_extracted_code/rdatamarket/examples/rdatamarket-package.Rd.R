library(rdatamarket)


### Name: rdatamarket-package
### Title: Data access API for DataMarket.com
### Aliases: rdatamarket-package

### ** Examples

oil <- dminfo("17tm")
print(oil)
series <- dmseries(oil, Country="Yemen")
lis <- dmlist(oil, Country=c("Algeria", "Angola"))




