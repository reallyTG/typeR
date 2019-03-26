library(rdatamarket)


### Name: dmlist
### Title: Fetch data in long form as a data.frame from a DataMarket
###   dataset.
### Aliases: dmlist

### ** Examples

dmlist("17tm")
dmlist("17tm!kqc=a")
dmlist("ds=17tm")
dmlist("ds=17tm!kqc=a")
dmlist("foo=bar&ds=17tm&baz=xyzzy")
dmlist("http://datamarket.com/api/v1/series.json?foo=bar&ds=17tm&baz=xyzzy")
dmlist("http://datamarket.com/data/set/17tm/#ds=17tm")
dmlist("17tm", Country="Algeria")
dmlist("17tm", Country=c("Algeria", "Angola"))
dmlist("12rb", "Country or Area"="Afghanistan")



