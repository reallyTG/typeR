library(benford.analysis)


### Name: getBfd
### Title: Gets the the statistics of the first Digits of a benford object
### Aliases: getBfd

### ** Examples

data(corporate.payment) 
cp <- benford(corporate.payment$Amount) #generates benford object
getBfd(cp) # equivalent to cp$bfd



