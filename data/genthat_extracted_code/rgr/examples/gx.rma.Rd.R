library(rgr)


### Name: gx.rma
### Title: Estimate the Coefficients of the Reduced Major Axis
### Aliases: gx.rma gx.youden youden youden.plot youden-plot youden_plot
### Keywords: regression htest

### ** Examples

## Make test available
data(ms.data1)
attach(ms.data1)

## Estimate RMA coefficients for duplicate measurements on rock samples
gx.rma(MS.1, MS.2, x1lab = "MS - 1", x2lab = "MS - 2", log = TRUE)

## Display an x-y plot of the data and the RMA
gx.rma(MS.1, MS.2, x1lab = "MS - 1", x2lab = "MS - 2", log = TRUE, 
	ifplot = TRUE, ifrma = TRUE)

## Detach test data
detach(ms.data1)

## Using function alts2dups
data(ms.data3)
attach(ms.data3)
gx.rma(alts2dups(MS, ifalt = TRUE), log = TRUE, ifplot = TRUE,
	ifrma = TRUE)

## Detach test data
detach(ms.data3)



