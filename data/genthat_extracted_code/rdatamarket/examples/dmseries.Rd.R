library(rdatamarket)


### Name: dmseries
### Title: Fetch timeseries from a DataMarket dataset.
### Aliases: dmseries

### ** Examples

dmseries("17tm")
dmseries("17tm!kqc=a")
dmseries("ds=17tm")
dmseries("ds=17tm!kqc=a")
dmseries("foo=bar&ds=17tm&baz=xyzzy")
dmseries("http://datamarket.com/api/v1/series.json?foo=bar&ds=17tm&baz=xyzzy")
dmseries("http://datamarket.com/data/set/17tm/#ds=17tm")
dmseries("17tm", Country="Algeria")
dmseries("17tm", Country=c("Algeria", "Angola"))



