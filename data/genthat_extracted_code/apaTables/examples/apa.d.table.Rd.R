library(apaTables)


### Name: apa.d.table
### Title: Creates a d-values for all paired comparisons in APA style
### Aliases: apa.d.table

### ** Examples

# View top few rows of viagra data set from Discovering Statistics Using R
head(viagra)

# Use apa.d.table function
apa.d.table(iv = dose, dv = libido, data = viagra, filename = "ex1_d_table.doc")



