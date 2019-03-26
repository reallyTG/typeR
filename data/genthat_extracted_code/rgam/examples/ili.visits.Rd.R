library(rgam)


### Name: ili.visits
### Title: Influenza-like-illness outpatient visits.
### Aliases: ili.visits
### Keywords: datasets

### ** Examples

library(rgam)
plot(visits ~ week, data=ili.visits, xlab='Week', ylab='ILI visits',
pch=19, col='grey75')
with(ili.visits, {
  a <- rgam(x=week, y=visits, family='poisson', cv.method='rcv',
            epsilon=1e-7, alpha=17/80, max.it=500)
  pr.rgam <- predict(a, type='response')
  lines(week[order(week)], pr.rgam[order(week)], lwd=3, col='red')
})



