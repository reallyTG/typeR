library(mortAAR)


### Name: print
### Title: Encode and print a mortaar_life_table or a
###   mortaar_life_table_list
### Aliases: print format.mortaar_life_table_list format.mortaar_life_table
###   print.mortaar_life_table_list print.mortaar_life_table

### ** Examples

# Create a mortaar_life_table from a prepared dataset.
schleswig_1 <- life.table(schleswig_ma[c("a", "Dx")])
print(schleswig_1)

# Create a mortaar_life_table_list from two datasets.
odagsen <- life.table(list(
  "corpus mandibulae" = odagsen_cm[c("a", "Dx")],
  "margo orbitalis" = odagsen_mo[c("a", "Dx")]
))
print(odagsen)




