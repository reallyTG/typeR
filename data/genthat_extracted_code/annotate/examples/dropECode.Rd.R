library(annotate)


### Name: dropECode
### Title: Drop GO labels for specified Evidence Codes
### Aliases: dropECode
### Keywords: manip

### ** Examples

 library("hgu95av2.db")
 bb <- hgu95av2GO[["39613_at"]]
 getEvidence(bb[1:3])
 cc <- dropECode(bb[1:3])
 if (length(cc))
   getEvidence(cc)



