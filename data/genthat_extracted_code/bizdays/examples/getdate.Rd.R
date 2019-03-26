library(bizdays)


### Name: getdate
### Title: Obtaining dates using other dates (or month or year) as
###   reference
### Aliases: getdate

### ** Examples

getdate("first day", ref("2018-01-01", ym = "month"), "actual")
getdate("10th wed", ref(2018), "actual")
getdate("last bizday", ref(2010:2018), "Brazil/ANBIMA")
dts <- seq(as.Date("2018-01-01"), as.Date("2018-12-01"), "month")
getdate("first bizday", ref(dts, ym = "month"), "Brazil/ANBIMA")



