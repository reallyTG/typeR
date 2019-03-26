library(tangram)


### Name: latex
### Title: Render to LaTeX methods for tangram cell objects
### Aliases: latex latex.default latex.cell latex.cell_label latex.cell_n
###   latex.cell_header latex.cell_subheader latex.cell_iqr
###   latex.cell_estimate latex.cell_fstat latex.cell_fraction
###   latex.cell_chi2 latex.cell_studentt latex.cell_spearman latex.tangram

### ** Examples

## Not run: 
##D latex(cell_label("123"))
##D latex(cell_iqr(rnorm(20)))
##D latex(cell_estimate(2.1,0.8, 3.3))
##D latex(cell_fraction(45, 137))
##D tbl <- tangram(drug~bili, pbc)
##D latex(tbl)
## End(Not run)



