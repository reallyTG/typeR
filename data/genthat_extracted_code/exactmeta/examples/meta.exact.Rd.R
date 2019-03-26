library(exactmeta)


### Name: meta.exact
### Title: Exact fixed effect meta analysis
### Aliases: meta.exact

### ** Examples

data=cbind(c(2, 1), c(1, 1), c(10, 10), c(12, 12))

meta.exact(data, type="risk difference", BB.grdnum=100, studyCI=FALSE)
meta.exact(data, type="rate difference", BB.grdnum=100, studyCI=FALSE)
meta.exact(data, type="risk ratio", BB.grdnum=100, studyCI=FALSE)
meta.exact(data, type="rate ratio", BB.grdnum=100)



