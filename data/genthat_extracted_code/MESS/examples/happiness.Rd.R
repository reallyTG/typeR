library(MESS)


### Name: happiness
### Title: Happiness score and tax rates for 148 countries
### Aliases: happiness
### Keywords: datasets

### ** Examples


data(happiness)
with(happiness, symbols(tax, happy, circles=sqrt(population)/8, inches=FALSE, bg=continent))

#
# Make a prettier image with transparent colors
#

newcols <- rgb(t(col2rgb(palette())),
               alpha=100, maxColorValue=255)

with(happiness, symbols(tax, happy, circles=sqrt(population)/8,
                inches=FALSE, bg=newcols[continent],
                xlab="Tax (% of GDP)", ylab="Happiness"))

#
# Simple analysis
#
res <- lm(happy ~ religion + population + tax:continent, data=happiness)
summary(res)





