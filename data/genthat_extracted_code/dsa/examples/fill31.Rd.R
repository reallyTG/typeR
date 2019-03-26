library(dsa)


### Name: fill31
### Title: Extending a daily time series to having 31 days each month.
### Aliases: fill31

### ** Examples

x<-xts::xts(rnorm(1095, 100,1), seq.Date(as.Date("2009-01-01"), length.out=1095, by="days"))
a31 <- fill31(x)
a <- drop31(a31, 1, 365)



