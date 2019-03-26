library(elec)


### Name: stark.test
### Title: stark.test
### Aliases: stark.test stark.test.Z stark.pairwise.test

### ** Examples

## pretending that santa cruz audit was a SRS audit (which it was not)
data(santa.cruz)
Z = elec.data(santa.cruz, C.names=c("leopold","danner"))
data(santa.cruz.audit)
## do some work to get the audit totals to overstatements
rownames(santa.cruz.audit) = santa.cruz.audit$PID
Z$audit = audit.totals.to.OS(Z, santa.cruz.audit)
Z$audit
stark.test.Z(Z)




