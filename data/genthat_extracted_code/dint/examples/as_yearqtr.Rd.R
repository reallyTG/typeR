library(dint)


### Name: as_yearqtr
### Title: Coerce to zoo yeartqr objects
### Aliases: as_yearqtr as_yearqtr.date_yq as_yearqtr.yearqtr as_yearmon
###   as_yearmon.date_ym as_yearmon.yearmon as_yearweek as_yearweek.date_yw
###   as_yearweek.yearweek

### ** Examples

q <- date_yq(2016, 1:4)
as.numeric(q)
qzoo <- as_yearqtr(q)
as.numeric(qzoo)

m <- date_ym(2016, 1:12)
as.numeric(m)
mzoo <- as_yearmon(m)
as.numeric(mzoo)

w <- date_yw(2016, 1:52)
as.numeric(w)
wzoo <- as_yearweek(w)
as.numeric(wzoo)




