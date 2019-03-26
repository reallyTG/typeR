library(spaMM)


### Name: fixedLRT
### Title: Likelihood ratio test of fixed effects.
### Aliases: fixedLRT
### Keywords: htest

### ** Examples

if (spaMM.getOption("example_maxtime")>1.6) {
 data("blackcap")
 ## result comparable to the corrHLfit examples based on blackcap
 fixedLRT(null.formula=migStatus ~ 1 + Matern(1|latitude+longitude),
       formula=migStatus ~ means + Matern(1|latitude+longitude), 
       HLmethod='ML',data=blackcap)
}
if (spaMM.getOption("example_maxtime")>186) {
 ## longer version with bootstrap
 fixedLRT(null.formula=migStatus ~ 1 + Matern(1|latitude+longitude),
       formula=migStatus ~ means + Matern(1|latitude+longitude), 
       HLmethod='ML',data=blackcap, boot.repl=100) 
 }



