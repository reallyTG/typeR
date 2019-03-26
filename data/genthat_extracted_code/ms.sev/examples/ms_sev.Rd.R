library(ms.sev)


### Name: ms_sev
### Title: MS-Severity
### Aliases: ms_sev
### Keywords: ARMSS EDSS severity MSSS

### ** Examples

data(edss)
out <- ms_sev(edss)
head(out$data)
out <- ms_sev(edss, type="global_msss", matrix=TRUE)

head(out$data)



