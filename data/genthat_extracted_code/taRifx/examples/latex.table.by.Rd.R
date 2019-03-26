library(taRifx)


### Name: latex.table.by
### Title: Exports a latex table with the first N columns being multirow
###   grouping variables.
### Aliases: latex.table.by

### ** Examples

my.test.df <- data.frame(grp=rep(c("A","B"),each=10),data=runif(20))
library(xtable)
latex.table.by(my.test.df)
## Not run: 
##D   print(latex.table.by(test.df), include.rownames = FALSE,
##D      include.colnames = TRUE, sanitize.text.function = force)
##D #   Then add \usepackage{multirow} to the preamble of your LaTeX document
##D #   For longtable support, add ,tabular.environment='longtable' to the print
##D #     command (plus add in ,floating=FALSE), then \usepackage{longtable} to
##D #     the LaTeX preamble
## End(Not run)



