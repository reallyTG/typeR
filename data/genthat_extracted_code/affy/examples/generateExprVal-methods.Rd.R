library(affy)


### Name: generateExprVal
### Title: Compute a summary expression value from the probes intensities
### Aliases: express.summary.stat express.summary.stat-methods
###   express.summary.stat.methods upDate.express.summary.stat.methods
### Keywords: manip

### ** Examples

if (require(affydata)) {
  data(Dilution)

  p <- probeset(Dilution, "1001_at")[[1]]

  par(mfcol=c(5,2))
  mymethods <- express.summary.stat.methods()
  nmet <- length(mymethods)
  nc <- ncol(pm(p))

  layout(matrix(c(1:nc, rep(nc+1, nc)), nc, 2), width = c(1, 1))

  barplot(p)

  results <- matrix(0, nc, nmet)
  rownames(results) <- paste("sample", 1:nc)
  colnames(results) <- mymethods

  for (i in 1:nmet) {
    ev <- express.summary.stat(p, summary=mymethods[i], pmcorrect="pmonly")
    if (mymethods[[i]] != "medianpolish")
      results[, i] <- 2^(ev$exprs)
    else
      results[, i] <- ev$exprs
  }

  dotchart(results, labels=paste("sample", 1:nc))
}



