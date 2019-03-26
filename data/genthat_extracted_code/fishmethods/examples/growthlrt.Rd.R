library(fishmethods)


### Name: growthlrt
### Title: Likelihood Ratio Tests for Comparing Multiple Growth Curves
### Aliases: growthlrt
### Keywords: misc htest

### ** Examples

## Normally, the length and age data will represent data for individuals.  
## Kimura's data are mean lengths-at-age but are usable because error=2 
## will calculate mean lengths-at-age from individual data. Since only  
## one value is present for each age,the mean length will be calculated
## as the same value.
data(Kimura)
growthlrt(len=Kimura$length,age=Kimura$age,group=Kimura$sex,model=1,error=2,select=1,
plottype=2)



