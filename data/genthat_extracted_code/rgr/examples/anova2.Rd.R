library(rgr)


### Name: anova2
### Title: Analysis of Variance (ANOVA), Alternate Input
### Aliases: anova2
### Keywords: univar htest

### ** Examples

## Make test data available
data(ms.data2)
attach(ms.data2)

## Undertake an ANOVA for duplicate measurements on rock samples
anova2(MS, log = TRUE, 
	xname = "Duplicate measurements of Magnetic Susceptibility")

## Detach test data
detach(ms.data2)

## Make test data available
data(ms.data3)
attach(ms.data3)

## Undertake an ANOVA for duplicate measurements on rock samples
anova2(MS, log = TRUE, ifalt = TRUE, 
	xname = "Duplicate measurements of Magnetic Susceptibility")

## Detach test data
detach(ms.data3)



