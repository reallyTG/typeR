library(sitar)


### Name: plot.sitar
### Title: Plot SITAR model
### Aliases: plot.sitar lines.sitar plot_d plot_v plot_D plot_V plot_u
###   plot_a plot_c lines.sitar plot_d plot_v plot_D plot_V plot_u plot_a
###   plot_c
### Keywords: aplot

### ** Examples


## fit sitar model
m1 <- sitar(x=age, y=height, id=id, data=heights, df=4)

## draw fitted distance and velocity curves
## with velocity curve in blue
## adding age at peak velocity
plot(m1, y2par=list(col='blue'), apv=TRUE)

## draw individually coloured growth curves adjusted for random effects
## using same x-axis limits as for previous plot
plot(m1, opt='a', col=id, xlim=xaxsd())

## add mean curve in red
lines(m1, opt='d', col='red', lwd=2)

## add mean curve for a, b, c = -1 SD
lines(m1, opt='d', lwd=2, abc=-sqrt(diag(getVarCov(m1))))

## draw fitted height distance curves coloured by subject, using ggplot
## Not run: 
##D require(ggplot2)
##D ggplot(plot_D(m1), aes(.x, .y, colour=.id)) +
##D labs(x='age', y='height') +
##D geom_line(show.legend=FALSE)
## End(Not run)



