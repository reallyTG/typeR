library(agridat)


### Name: wallace.iowaland
### Title: Iowa farmland values by county in 1925
### Aliases: wallace.iowaland
### Keywords: datasets

### ** Examples


data(wallace.iowaland)
dat <- wallace.iowaland

# Interesting trends involving latitude
require(lattice)
splom(~dat[,-c(1:2)], type=c('p','smooth'), lwd=2, main="wallace.iowaland")

# Means. Similar to Wallace table 1
apply(dat[, c('yield','corn','grain','untillable','fedval')], 2, mean)

# Correlations.  Similar to Wallace table 2
round(cor(dat[, c('yield','corn','grain','untillable','fedval')]),2)

m1 <- lm(fedval ~ yield + corn + grain + untillable, dat)
summary(m1) # estimates similar to Wallace, top of p. 389

# Choropleth map
require(maps)
data(county.fips)
dat <- transform(dat, polnm = paste0('iowa,',county)) # polnm example: iowa,adair

if(require("latticeExtra")){ # for mapplot
  redblue <- colorRampPalette(c("firebrick", "lightgray", "#375997"))
  mapplot(polnm~fedval , data=dat, colramp=redblue,
          main="wallace.iowaland - Federal land values",
          xlab="Land value, dollars per acre",
          scales=list(draw=FALSE),
          map=map('county', 'iowa', plot=FALSE,
            fill=TRUE, projection="mercator"))
}




