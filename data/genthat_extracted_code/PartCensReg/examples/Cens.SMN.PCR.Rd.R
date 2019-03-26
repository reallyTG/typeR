library(PartCensReg)


### Name: Cens.SMN.PCR
### Title: Estimation and diagnostics for partially linear censored
###   regression models
### Aliases: Cens.SMN.PCR
### Keywords: package censored censoring diagnostic partial partially

### ** Examples

dtawage = get(data(PSID1976,package = "AER"))
y  = dtawage$wage
cc = c(rep(0,428),rep(1,325))
tt = dtawage$exper
x  = cbind(dtawage$education,dtawage$age, dtawage$hhours, dtawage$hwage, dtawage$tax,
dtawage$youngkids, dtawage$oldkids)

#Normal case by default with only 10 iterations
PCR.default1 = Cens.SMN.PCR(x=x, y=y, c=cc, cens="left",tt =tt,iter.max = 10,Diagnostic = FALSE)

## Not run: 
##D #This may take few minutes
##D #Normal case by default with full (200) iterations
##D PCR.default2 = Cens.SMN.PCR(x=x, y=y, c=cc, cens="left",tt =tt)
##D 
##D #contaminated normal case
##D PCR.CN = Cens.SMN.PCR(x=x, y=y, c=cc, cens="left",tt =tt,type="NormalC",
##D nu = c(0.1,0.1),iter.max = 100)
## End(Not run)



