library(HistData)


### Name: PearsonLee
### Title: Pearson and Lee's data on the heights of parents and children
###   classified by gender
### Aliases: PearsonLee
### Keywords: datasets

### ** Examples

data(PearsonLee)
str(PearsonLee)

with(PearsonLee, 
    {
    lim <- c(55,80)
    xv <- seq(55,80, .5)
    sunflowerplot(parent,child, number=frequency, xlim=lim, ylim=lim, seg.col="gray", size=.1)
    abline(lm(child ~ parent, weights=frequency), col="blue", lwd=2)
    lines(xv, predict(loess(child ~ parent, weights=frequency), data.frame(parent=xv)), 
          col="blue", lwd=2)
    # NB: dataEllipse doesn't take frequency into account
    if(require(car)) {
    dataEllipse(parent,child, xlim=lim, ylim=lim, plot.points=FALSE)
        }
  })

## separate plots for combinations of (chl, par)

# this doesn't quite work, because xyplot can't handle weights
require(lattice)
xyplot(child ~ parent|par+chl, data=PearsonLee, type=c("p", "r", "smooth"), col.line="red")

# Using ggplot [thx: Dennis Murphy]
require(ggplot2)
ggplot(PearsonLee, aes(x = parent, y = child, weight=frequency)) +
   geom_point(size = 1.5, position = position_jitter(width = 0.2)) +
   geom_smooth(method = lm, aes(weight = PearsonLee$frequency,
               colour = 'Linear'), se = FALSE, size = 1.5) +
   geom_smooth(aes(weight = PearsonLee$frequency,
               colour = 'Loess'), se = FALSE, size = 1.5) +
   facet_grid(chl ~ par) +
   scale_colour_manual(breaks = c('Linear', 'Loess'),
                       values = c('green', 'red')) +
   theme(legend.position = c(0.14, 0.885),
        legend.background = element_rect(fill = 'white'))

# inverse regression, as in Wachmuth et al. (2003)

ggplot(PearsonLee, aes(x = child, y = parent, weight=frequency)) +
   geom_point(size = 1.5, position = position_jitter(width = 0.2)) +
   geom_smooth(method = lm, aes(weight = PearsonLee$frequency,
               colour = 'Linear'), se = FALSE, size = 1.5) +
   geom_smooth(aes(weight = PearsonLee$frequency,
               colour = 'Loess'), se = FALSE, size = 1.5) +
   facet_grid(chl ~ par) +
   scale_colour_manual(breaks = c('Linear', 'Loess'),
                       values = c('green', 'red')) +
   theme(legend.position = c(0.14, 0.885),
        legend.background = element_rect(fill = 'white'))




