## -------------------------------------------
## routine tests for expression values methods
## -------------------------------------------

library(affy)
library(affydata)

data(Dilution)

 essm = express.summary.stat.methods()
 i <- match("playerout", essm)
 meths <- essm[-i]

for (m in meths) {
  for (mbc in pmcorrect.methods()) {
     cat("expression value with method=", m, "bg correct=", mbc, "...")
     computeExprSet(Dilution, pmcorrect.method=mbc, summary.method=m)
     cat("done.\n")
   }
}

## playerout alone 'cause very slow
m <- "playerout"
for (mbc in pmcorrect.methods()) {
  cat("expression value with method=", m, "bg correct=", mbc, "...")
  computeExprSet(Dilution, pmcorrect.method=mbc, summary.method=m,
                 ids=geneNames(Dilution)[1:3]) 
  cat("done.\n")
}


