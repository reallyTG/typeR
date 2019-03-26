library(NlsyLinks)


### Name: AceEstimate-class
### Title: Class '"AceEstimate"'
### Aliases: AceEstimate-class GetDetails,AceEstimate-method
###   getEstimate,AceEstimate-method initialize,AceEstimate-method
###   print,AceEstimate-method show,AceEstimate-method
### Keywords: ACE classes

### ** Examples

library(NlsyLinks) #Load the package into the current R session.

showClass("AceEstimate")
est <- CreateAceEstimate(.5, .2, .3, 40)
est 
print(est)



