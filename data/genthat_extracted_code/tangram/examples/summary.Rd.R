library(tangram)


### Name: summary.tangram
### Title: The default method for rendering tangram objects A tangram is a
###   summary, so it returns itself. Otherwise convert to a text
###   representation.
### Aliases: summary.tangram summary.table_builder summary.cell
###   summary.cell_label summary.cell_spearman summary.cell_iqr
###   summary.cell_range summary.cell_estimate summary.cell_fraction
###   summary.cell_fstat summary.cell_chi2 summary.cell_studentt

### ** Examples

summary(cell_label("123"))
summary(cell_iqr(rnorm(20)))
summary(cell_estimate(2.1,0.8, 3.3))
summary(cell_fraction(45, 137))
summary(table_builder()   %>%
        row_header("row") %>%
        col_header(1,2,3) %>%
        add_col("A","B","C"))
summary(tangram(drug~bili, pbc))



