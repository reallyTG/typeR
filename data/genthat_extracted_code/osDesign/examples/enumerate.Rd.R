library(osDesign)


### Name: enumerate
### Title: Enumerate Function
### Aliases: enumerate enumerate.count enumerate.window

### ** Examples

data(infants0709, package = "osDesign")

#  Get marginal totals for low birth weight and smoking status by county
MM = table(infants0709$county, infants0709$smoker)
NN = table(infants0709$county, infants0709$lowbw)

#  Determine the number of possible solutions to margin totals for county 48
enumerate.count(MM[48,], NN[48,])

#  Generate matrix with all possible solutions to margin totals for county 48
enumerate(MM[48,], NN[48,])



