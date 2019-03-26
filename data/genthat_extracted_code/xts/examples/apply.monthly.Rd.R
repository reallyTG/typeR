library(xts)


### Name: apply.monthly
### Title: Apply Function over Calendar Periods
### Aliases: apply.daily apply.weekly apply.monthly apply.quarterly
###   apply.yearly
### Keywords: utilities

### ** Examples

xts.ts <- xts(rnorm(231),as.Date(13514:13744,origin="1970-01-01"))

start(xts.ts)
end(xts.ts)

apply.monthly(xts.ts,mean)
apply.monthly(xts.ts,function(x) var(x))



