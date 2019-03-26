library(mefa)


### Name: report.mefa
### Title: Write Report of an Object of Class 'mefa' into File
### Aliases: report.mefa report
### Keywords: methods IO

### ** Examples

data(dol.count, dol.samp, dol.taxa)
x <- mefa(stcs(dol.count), dol.samp, dol.taxa)
## Not run: 
##D ## Plain text
##D ## Count values from x$xtab
##D report(x, "report-all.txt")
##D ## Count values for each segments
##D report(x, "report-segm-all.txt",
##D     samp.var = c("method","microhab"), segment = TRUE)
##D ## LaTeX formatting
##D report(x, "report-all.tex", tex=TRUE)
##D ## For how to include into a TeX or Rnw file, see:
##D mefadocs("SampleReport")
## End(Not run)



