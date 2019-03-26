library(klausuR)


### Name: nret.translator
### Title: Convert NRET/ET data between klausuR and other software
### Aliases: nret.translator
### Keywords: misc

### ** Examples

## Not run: 
##D # from SPSS to R
##D data(spss.data)
##D klausuR.data <- nret.translator(spss.data, spss="in")
##D spss.corr <- c(
##D    item01=2, item02=3, item03=3, item04=3, item05=2,
##D    item06=2, item07=3, item08=1, item09=1, item10=2)
##D klausuR.corr <- nret.translator(spss.corr, spss="in", corr=TRUE, num.alt=3)
##D 
##D # from R to SPSS
##D spss.data <- nret.translator(klausuR.data)
##D spss.corr <- nret.translator(klausuR.corr, corr=TRUE, num.alt=3)
##D # if you find the syntax useful
##D cat(spss.corr$syntax, file="~/somewhere/NRET.sps")
## End(Not run)



