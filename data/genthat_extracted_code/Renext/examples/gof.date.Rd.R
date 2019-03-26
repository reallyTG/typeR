library(Renext)


### Name: gof.date
### Title: Goodness-of-fit for the distribution of dates
### Aliases: gof.date

### ** Examples

## Use "Brest" dataset
## simple plot. Kolmogorov-Smirnov is not useful
gof1 <- gof.date(date = Brest$OTdata$date)

## consider missing periods. Much better!
gof2 <- gof.date(date = Brest$OTdata$date,
         skip = Brest$OTmissing,
         start = Brest$OTinfo$start,
         end = Brest$OTinfo$end)

print(gof2$noskip)

## Second type of graph
gof3 <- gof.date(date = Brest$OTdata$date,
         skip = Brest$OTmissing,
         start = Brest$OTinfo$start,
         end = Brest$OTinfo$end,
         plot.type = "omit")

## non-skipped periods at Brest
ns <- skip2noskip(skip = Brest$OTmissing,
                 start = Brest$OTinfo$start,
                 end = Brest$OTinfo$end)

## say 9 plots/diagnostics
oldpar <- par(mar = c(3, 4, 3, 2), mfcol = c(3, 3))

for (i in 1:9) {
  GOF <- gof.date(date = Brest$OTdata$date,
           start = ns$start[i],
           end = ns$end[i])
}

par(oldpar)




