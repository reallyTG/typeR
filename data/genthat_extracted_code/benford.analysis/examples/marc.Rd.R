library(benford.analysis)


### Name: marc
### Title: Gets the Mantissa Arc test of a Benford object
### Aliases: marc

### ** Examples

data(corporate.payment) #gets data 
cp <- benford(corporate.payment$Amount) #generates benford object
marc(cp) # equivalent to cp$stats$mantissa.arc.test



