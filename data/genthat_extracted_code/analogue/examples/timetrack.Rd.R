library(analogue)


### Name: timetrack
### Title: Timetracks of change in species composition
### Aliases: timetrack print.timetrack plot.timetrack points.timetrack
###   fitted.timetrack scores.timetrack predict.timetrack
### Keywords: methods hplot

### ** Examples

## load the RLGH and SWAP data sets
data(rlgh, swapdiat)

## Fit the timetrack ordination
mod <- timetrack(swapdiat, rlgh, transform = "hellinger",
                 method = "rda")
mod

## Plot the timetrack
plot(mod, ptype = "b", col = c("forestgreen", "orange"), lwd = 2)

## Other options (reorder the time track)
ord <- rev(seq_len(nrow(rlgh)))
plot(mod, choices = 2:3, order = ord, ptype = "b",
     col = c("forestgreen", "orange"), lwd = 2)

## illustrating use of the formula
data(swappH)
mod2 <- timetrack(swapdiat, rlgh, env = data.frame(pH = swappH),
                  transform = "hellinger", method = "rda",
                  formula = ~ pH)
mod2
plot(mod2)

## scores and fitted methods
head(fitted(mod, type = "passive"))
head(scores(mod, type = "passive"))

## predict locations in timetrack for new observations
take <- rlgh[1:50, ]
take <- take[ , colSums(take) > 0]
mod3 <- predict(mod, newdata = take)
class(mod3) ## returns a timetrack object
take <- rlgh[-(1:50), ]
take <- take[ , colSums(take) > 0]
mod4 <- predict(mod, newdata = take)

## build a plot up from base parts
plot(mod, type = "n", ptype = "n")
points(mod, which = "ordination", col = "grey", pch = 19, cex = 0.7)
points(mod3, which = "passive", col = "red")
points(mod4, which = "passive", col = "blue")

## Fit the timetrack ordination - passing scaling args
mod <- timetrack(swapdiat, rlgh, transform = "hellinger",
                 method = "rda", scaling = "sites",
                 correlation = TRUE)
mod
plot(mod)




