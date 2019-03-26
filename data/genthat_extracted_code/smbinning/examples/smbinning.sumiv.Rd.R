library(smbinning)


### Name: smbinning.sumiv
### Title: Information Value Summary
### Aliases: smbinning.sumiv

### ** Examples

# Load library and its dataset
library(smbinning)

# Test sample
test=subset(smbsimdf1,rnd>0.9) # Training sample
test$rnd=NULL

# Example: Information Value Summary
testiv=smbinning.sumiv(test,y="fgood")
testiv

# Example: Plot of Information Value Summary
smbinning.sumiv.plot(testiv)



