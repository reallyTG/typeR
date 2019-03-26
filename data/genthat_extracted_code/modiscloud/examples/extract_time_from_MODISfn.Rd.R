library(modiscloud)


### Name: extract_time_from_MODISfn
### Title: Extract the year, day, and hour from a MODIS filename
### Aliases: extract_time_from_MODISfn

### ** Examples

yearday_to_date(year=2012, day=364)
# $month
# [1] 12
#
# $day
# [1] 29
#
# $year
# [1] 2008

fn = "MOD03.A2008001.0400.005.2010216170200.hdf"
extract_time_from_MODISfn(fn)



