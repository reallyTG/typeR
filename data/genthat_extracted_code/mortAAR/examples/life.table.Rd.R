library(mortAAR)


### Name: life.table
### Title: Calculates a life table
### Aliases: life.table

### ** Examples

# Create a mortaar_life_table from a prepared dataset.
schleswig_1 <- life.table(schleswig_ma[c("a", "Dx")])
print(schleswig_1)
plot(schleswig_1, display = "lx")

# Create a mortaar_life_table_list from two datasets.
odagsen <- life.table(list(
  "corpus mandibulae" = odagsen_cm[c("a", "Dx")],
  "margo orbitalis" = odagsen_mo[c("a", "Dx")]
))
print(odagsen)
plot(odagsen, display = "ex")

# Prepare a real world dataset and create a mortaar_life_table.
library(magrittr)
magdalenenberg %>%
 replace(. == "60-x", "60-70") %>%
 tidyr::separate(a, c("from", "to")) %>%
 dplyr::mutate(from = as.numeric(from), to = as.numeric(to)) %>%
 prep.life.table(
  dec = "Dx",
  agebeg = "from",
  ageend = "to",
  method = "Standard",
  agerange = "excluded"
 ) %>%
 life.table()





