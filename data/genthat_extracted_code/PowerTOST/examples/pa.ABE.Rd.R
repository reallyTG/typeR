library(PowerTOST)


### Name: pa.ABE
### Title: Power analysis for average bioequivalence (ABE)
### Aliases: pa.ABE print.pwrA plot.pwrA

### ** Examples

# using the defaults
# design="2x2", targetpower=0.8, minpower=0.7, theta0/GMR=0.95
# BE margins from defaults of sampleN.TOST() 0.8 ... 1.25
# print & plot implicitly
pa.ABE(CV=0.2)
# print & plot
## Not run: 
##D res <- pa.ABE(CV=0.2)
##D print(res, plotit=FALSE)               # print only
##D plot(res, pct=FALSE, ratiolabel="GMR") # changed from defaults
## End(Not run)



