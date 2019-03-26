library(mortAAR)


### Name: plot
### Title: Plot a mortaar_life_table or a mortaar_life_table_list
### Aliases: plot plot.mortaar_life_table plot.mortaar_life_table_list

### ** Examples

# Create a mortaar_life_table from a prepared dataset.
schleswig_1 <- life.table(schleswig_ma[c("a", "Dx")])
plot(schleswig_1)
plot(schleswig_1, display = "qx")

# Create a mortaar_life_table_list from two datasets.
odagsen <- life.table(list(
  "corpus mandibulae" = odagsen_cm[c("a", "Dx")],
  "margo orbitalis" = odagsen_mo[c("a", "Dx")]
))
plot(odagsen)
plot(odagsen, display = "lx")




