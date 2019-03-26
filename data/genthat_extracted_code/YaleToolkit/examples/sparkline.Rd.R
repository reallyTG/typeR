library(YaleToolkit)


### Name: sparkline
### Title: Draws a sparkline
### Aliases: sparkline
### Keywords: ts

### ** Examples


### sparkline examples
data(nhtemp)

## The default behaviour of sparkline

sparkline(nhtemp)

## Creating stand-alone plots

sparkline(rnorm(10),
                buffer = unit(1, "lines"),
                ptopts = 'first.last',
                margins = unit(c(1,1,1,1), 'inches'),
                yaxis = TRUE, xaxis=TRUE,
                IQR = gpar(fill = 'grey', col = 'grey'),
                main = "Ten Random Standard Normal Numbers",
                sub = '...plotted here')

data(YaleEnergy)
y <- YaleEnergy[YaleEnergy$name==YaleEnergy$name[2],]
sparkline(y$ELSQFT, times=y$year+y$month/12,
          xaxis=TRUE, yaxis=TRUE, main="Branford College Electrical Consumption",
          buffer=unit(1, "lines"), margins = unit(c(1, 1, 1, 1), 'inches'))

sparkline(Nile,
                buffer = unit(1, "lines"),
                ptopts = list(labels = 'min.max'),
                margin.pars = gpar(fill = 'lightblue'),
                buffer.pars = gpar(fill = 'lightgreen'),
                frame.pars = gpar(fill = 'lightyellow'),
                yaxis = TRUE, xaxis=TRUE,
                IQR = gpar(fill = 'grey', col = 'grey'),
                main="Nile Discharge between 1871 and 1970",
                sub='In what units?')

## Adding a sparkline to an existing plot

grid.newpage()
pushViewport(viewport(w = 0.8, h = 0.8))
sparkline(rnorm(10),
                buffer = unit(1, "lines"),
                margins = unit(c(4,4,4,4),'points'),
                ptopts = list(labels = 'min.max'),
                margin.pars = gpar(fill = 'lightblue'),
                buffer.pars = gpar(fill = 'lightgreen'),
                frame.pars = gpar(fill = 'lightyellow'),
                yaxis = TRUE, xaxis=TRUE,
                IQR = gpar(fill = 'grey', col = 'grey'),
                main="Title (plotted OUTSIDE the viewport)", new = FALSE)
popViewport()




