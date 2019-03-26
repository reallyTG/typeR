library(benford.analysis)


### Name: mantissa
### Title: Gets the main stats of the Mantissa of a Benford object
### Aliases: mantissa

### ** Examples

data(corporate.payment) #gets data 
cp <- benford(corporate.payment$Amount) #generates benford object
mantissa(cp) # equivalent to cp$mantissa



