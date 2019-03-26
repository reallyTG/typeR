library(tangram)


### Name: print.cell
### Title: Print methods for tangram objects
### Aliases: print.cell print.tangram

### ** Examples

print(cell_label("123"))
print(cell_iqr(rnorm(20)))
print(cell_estimate(2.1,0.8, 3.3))
print(cell_fraction(45, 137))
print(table_builder()   %>%
        row_header("row") %>%
        col_header(1,2,3) %>%
        add_col("A","B","C"))
print(tangram(drug~bili, pbc))



