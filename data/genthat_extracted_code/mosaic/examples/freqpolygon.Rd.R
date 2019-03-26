library(mosaic)


### Name: freqpolygon
### Title: Frequency Polygons
### Aliases: freqpolygon prepanel.default.freqpolygon panel.freqpolygon

### ** Examples

freqpolygon(~age | substance, data=HELPrct, v=35)
freqpolygon(~age, data=HELPrct, labels=TRUE, type='count')
freqpolygon(~age | substance, data=HELPrct, groups=sex)
freqpolygon(~age | substance, data=HELPrct, groups=sex, ylim=c(0,0.11))
## comparison of histogram and frequency polygon
histogram(~eruptions, faithful, type='density', width=.5)
ladd( panel.freqpolygon(faithful$eruptions, width=.5 ))



