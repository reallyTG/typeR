library(Renext)


### Name: NBlevy
### Title: Negative Binomial Levy process
### Aliases: NBlevy

### ** Examples

## known parameters
nint <- 100
gam <- 6; prob <- 0.20

## draw random w, then the counts N
w <- rgamma(nint, shape = 3, scale = 1/5)
N <- rnbinom(nint, size = w * gam, prob = prob)
mu <- w * gam * (1 - prob) / prob
Res <- NBlevy(N = N, w = w)

## Use example data 'Brest'
## compute the number of event and duration of the non-skipped periods
gof1 <- gof.date(date = Brest$OTdata$date,
                 skip = Brest$OTmissing,
                 start = Brest$OTinfo$start,
                 end = Brest$OTinfo$end,
                 plot.type = "omit")
ns1 <- gof1$noskip
## fit the NBlevy
fit1 <- NBlevy(N = ns1$nevt, w = ns1$duration)

## use a higher threshold
OT2 <- subset(Brest$OTdata, Surge > 50)
gof2 <- gof.date(date = OT2$date,
                 skip = Brest$OTmissing,
                 start = Brest$OTinfo$start,
                 end = Brest$OTinfo$end,
                 plot.type = "omit")
ns2 <- gof2$noskip
## the NBlevy prob is now closer to 1
fit2 <- NBlevy(N = ns2$nevt, w = ns2$duration)

c(fit1$prob, fit2$prob)



