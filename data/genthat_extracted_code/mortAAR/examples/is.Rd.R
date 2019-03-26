library(mortAAR)


### Name: is
### Title: Checks if a variable is of class mortaar_life_table or
###   mortaar_life_table_list
### Aliases: is is.mortaar_life_table_list is.mortaar_life_table

### ** Examples

# Create a mortaar_life_table from a prepared dataset.
class(schleswig_ma)
is.mortaar_life_table(schleswig_ma)

schleswig_1 <- life.table(schleswig_ma[c("a", "Dx")])

class(schleswig_1)
is.mortaar_life_table(schleswig_1)

# Create a mortaar_life_table_list from two datasets.
odagsen <- life.table(list(
  "corpus mandibulae" = odagsen_cm[c("a", "Dx")],
  "margo orbitalis" = odagsen_mo[c("a", "Dx")]
))
is.mortaar_life_table_list(odagsen)




