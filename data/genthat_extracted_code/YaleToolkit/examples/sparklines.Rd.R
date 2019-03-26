library(YaleToolkit)


### Name: sparklines
### Title: Draws a panel of vertically stacked sparklines
### Aliases: sparklines
### Keywords: ts

### ** Examples


### sparkline examples
data(beaver1)

## The default behaviour of sparklines
sparklines(beaver1)

sparklines(beaver1,
           outer.margin = unit(c(2,4,4,5), 'lines'),
           outer.margin.pars = gpar(fill = 'lightblue'),
           buffer = unit(1, "lines"),
           frame.pars = gpar(fill = 'lightyellow'),
           buffer.pars = gpar(fill = 'lightgreen'),
           yaxis = TRUE, xaxis=FALSE,
           IQR = gpar(fill = 'grey', col = 'grey'),
           main = 'Beaver 1')

data(YaleEnergy)
y <- YaleEnergy[YaleEnergy$name==YaleEnergy$name[2],]
sparklines(y[,c("ELSQFT", "STEAM")], times=y$year+y$month/12,
           main="Branford Electric and Steam Consumption")

## Adding a pair of sparklines to an existing plot

grid.newpage()
pushViewport(viewport(w = 0.8, h = 0.8))
sparklines(data.frame(x = rnorm(10), y = rnorm(10, mean=5)), new = FALSE)
popViewport()

grid.newpage()
pushViewport(viewport(w = 0.8, h = 0.8))
sparklines(data.frame(x = rnorm(10), y = rnorm(10, mean=2)),
                buffer = unit(1, "lines"),
                frame.pars = gpar(fill = 'lightyellow'),
                yaxis = TRUE, xaxis=FALSE,
                IQR = gpar(fill = 'grey', col = 'grey'), new = FALSE)
popViewport()




