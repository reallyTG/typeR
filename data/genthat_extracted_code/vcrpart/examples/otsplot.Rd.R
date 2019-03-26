library(vcrpart)


### Name: otsplot
### Title: Time-series plot for longitudinal ordinal data
### Aliases: otsplot otsplot.default otsplot_control otsplot_filter
### Keywords: hplot

### ** Examples

## ------------------------------------------------------------------- #
## Dummy example: 
##
## Plotting artificially generated ordinal longitudinal data
## ------------------------------------------------------------------- #

## load the data
data(vcrpart_1)
vcrpart_1 <- vcrpart_1[1:40,]

## plot the data
otsplot(x = vcrpart_1$wave, y = vcrpart_1$y, subject = vcrpart_1$id)

## using 'groups'
groups <- rep(c("A", "B"), each = nrow(vcrpart_1) / 2L)
otsplot(x = vcrpart_1$wave, y = vcrpart_1$y, subject = vcrpart_1$id,
        groups = groups)

## color series with supports over 30%
otsplot(x = vcrpart_1$wave, y = vcrpart_1$y, subject = vcrpart_1$id,
        filter = otsplot_filter("minfreq", level = 0.3))

## highlight the 50% most frequent series
otsplot(x = vcrpart_1$wave, y = vcrpart_1$y, subject = vcrpart_1$id,
        filter = otsplot_filter("cumfreq", level = 0.5))

## linearly grey out series with low support 
otsplot(x = vcrpart_1$wave, y = vcrpart_1$y, subject = vcrpart_1$id,
        filter = otsplot_filter("linear"))

## subject-wise plot 
otsplot(x = vcrpart_1$wave, y = vcrpart_1$y,
        subject = vcrpart_1$id, groups = vcrpart_1$id)



