library(IPMpack)


### Name: generateData
### Title: Generates random data in the form used by IPMpack.
### Aliases: generateData

### ** Examples

dff <- generateData(nSamp=2000, type="simple")
head(dff)

dff <- generateData(nSamp=2000, type="discrete")
head(dff)

dff <- generateData(nSamp=2000, type="stochastic")
head(dff)




