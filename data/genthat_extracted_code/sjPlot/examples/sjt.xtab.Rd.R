library(sjPlot)


### Name: sjt.xtab
### Title: Summary of contingency tables as HTML table
### Aliases: sjt.xtab

### ** Examples

# prepare sample data set
data(efc)

# print simple cross table with labels
## Not run: 
##D sjt.xtab(efc$e16sex, efc$e42dep)
##D 
##D # print cross table with manually set
##D # labels and expected values
##D sjt.xtab(
##D   efc$e16sex,
##D   efc$e42dep,
##D   var.labels = c("Elder's gender", "Elder's dependency"),
##D   show.exp = TRUE
##D )
##D 
##D # print minimal cross table with labels, total col/row highlighted
##D sjt.xtab(efc$e16sex, efc$e42dep, show.cell.prc = FALSE, emph.total = TRUE)
##D 
##D # User defined style sheet
##D sjt.xtab(efc$e16sex, efc$e42dep,
##D          CSS = list(css.table = "border: 2px solid;",
##D                     css.tdata = "border: 1px solid;",
##D                     css.horline = "border-bottom: double blue;"))
## End(Not run)

# ordinal data, use Kendall's tau
sjt.xtab(efc$e42dep, efc$quol_5, statistics = "kendall")

# calculate Spearman's rho, with continuity correction
sjt.xtab(
  efc$e42dep,
  efc$quol_5,
  statistics = "spearman",
  exact = FALSE,
  continuity = TRUE
)




