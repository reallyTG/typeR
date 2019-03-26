library(outbreaks)


### Name: nipah_malaysia
### Title: Nipah in Malaysia and Sinagapore, 1997-1999
### Aliases: nipah_malaysia
### Keywords: datasets

### ** Examples

## show first few weeks of Dengue incidence
head(nipah_malaysia)

## convert data to incidence object and plot epicurve using the incidence package
library(incidence)
cases <- subset(nipah_malaysia, select = c("perak", "negeri_sembilan", "selangor",
 "singapore"))
i <- as.incidence(cases, dates = nipah_malaysia$date, interval = 7L)
plot(i)




