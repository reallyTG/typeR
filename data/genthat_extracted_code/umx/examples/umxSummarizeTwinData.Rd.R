library(umx)


### Name: umxSummarizeTwinData
### Title: Summarize twin data
### Aliases: umxSummarizeTwinData

### ** Examples

data(twinData)
umxSummarizeTwinData(twinData, sep = "", selVars = c("wt", "ht"))
MZs = c("MZMM", "MZFF"); DZs = c("DZFF","DZMM", "DZOS")
umxSummarizeTwinData(twinData, sep = "", selVars = c("wt", "ht"), MZ = MZs, DZ = DZs)



