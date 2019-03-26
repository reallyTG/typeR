library(fts)


### Name: indicators
### Title: Trading indicators
### Aliases: indicators above.ma analog below.ma wday mday diff.fts up down
###   ema gap.continue gap.direction gap.down gap.down.continue
###   gap.down.reverse gap.reverse gap.up gap.up.continue gap.up.reverse
###   higher.high higher.low hl.oc.ratio inside.day inside.day.direction
###   inside.day.down inside.day.up lower.high lower.low ma.crossover
###   ma.crossover.down ma.crossover.up ma.d ma.distance month year
###   monthly.sum new.high new.low outside.day outside.day.direction
###   outside.day.down outside.day.up pct.chg repeated rsi rsi.crossover
###   rsi.crossover.down rsi.crossover.up template.fts trend.day
###   trend.day.down trend.day.up
### Keywords: ts

### ** Examples

x <- fts(index=seq(from=Sys.Date(),by="months",length.out=5),rnorm(5))
print(x)
lag(x,1)
lead(x,1)



