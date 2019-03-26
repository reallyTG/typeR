library(rgr)


### Name: anova1
### Title: Analysis of Variance (ANOVA)
### Aliases: anova1
### Keywords: univar htest

### ** Examples

## Make test data available
data(ms.data1)
attach(ms.data1)

## Undertake an ANOVA for duplicate measurements on rock samples
anova1(MS.1, MS.2, log = TRUE, 
	xname = "Duplicate measurements of Magnetic Susceptibility")

## Detach test data 
detach(ms.data1)



