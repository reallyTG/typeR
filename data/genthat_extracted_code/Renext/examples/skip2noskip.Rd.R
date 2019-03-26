library(Renext)


### Name: skip2noskip
### Title: Fix non-skipped periods from skipped ones
### Aliases: skip2noskip

### ** Examples

## Brest data embeds a description of the gaps

ns <- skip2noskip(skip = Brest$OTmissing)

ns2 <- skip2noskip(skip = Brest$OTmissing,
                   start = Brest$OTinfo$start,
                   end = Brest$OTinfo$end)

## check durations. dur2 should be equal to the effective
## duration (with an error of a fraction of day)
dur <- as.numeric(sum(ns$end-ns$start))/365.25
dur2 <- as.numeric(sum(ns2$end-ns2$start))/365.25





