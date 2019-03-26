## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(dplyr)
library(ggplot2)
library(matsbyname)
library(matsindf)
library(tidyr)
library(tibble)

## ------------------------------------------------------------------------
head(UKEnergy2000, 2)

## ------------------------------------------------------------------------
UKEnergy2000_with_metadata <- UKEnergy2000 %>% 
  # Add a column indicating the matrix in which this entry belongs (U, V, or Y).
  matsindf:::add_UKEnergy2000_matnames(.) %>% 
  # Add columns for row names, column names, row types, and column types.
  matsindf:::add_UKEnergy2000_row_col_meta(.) %>% 
  mutate(
    # Eliminate columns we no longer need
    Ledger.side = NULL,
    Flow.aggregation.point = NULL,
    Flow = NULL,
    Product = NULL, 
    # Ensure that all energy values are positive, as required for analysis.
    E.ktoe = abs(E.ktoe)
  )
head(UKEnergy2000_with_metadata, 2)

## ------------------------------------------------------------------------
EnergyMats_2000 <- UKEnergy2000_with_metadata %>% 
  group_by(Country, Year, matname) %>% 
  collapse_to_matrices(matnames = "matname", matvals = "E.ktoe",
                       rownames = "rowname", colnames = "colname", 
                       rowtypes = "rowtype", coltypes = "coltype") %>% 
  rename(matrix.name = matname, matrix = E.ktoe)

# The remaining columns are Country, Year, matrix.name, and matrix
glimpse(EnergyMats_2000)

# To access one of the matrices, try one of these approaches:
(EnergyMats_2000 %>% filter(matrix.name == "U"))[["matrix"]] # The U matrix

EnergyMats_2000$matrix[[2]] # The V matrix

EnergyMats_2000$matrix[[3]] # The Y matrix

## ------------------------------------------------------------------------
Energy <- EnergyMats_2000 %>% 
  # Create rows for a fictitious country "AB".
  # Although the rows for "AB" are same as the "GB" rows,
  # they serve to illustrate functional programming with matsindf.
  rbind(EnergyMats_2000 %>% mutate(Country = "AB")) %>% 
  spread(key = Year, value = matrix) %>% 
  mutate(
    # Create a column for a second year (2001).
    `2001` = `2000`
  ) %>% 
  gather(key = Year, value = matrix, `2000`, `2001`) %>% 
  # Now spread to put each matrix in a column.
  spread(key = matrix.name, value = matrix)

glimpse(Energy)

## ------------------------------------------------------------------------
Check <- Energy %>% 
  mutate(
    W = difference_byname(transpose_byname(V), U),
    # Need to change column name and type on y so it can be subtracted from row sums of W
    err = difference_byname(rowsums_byname(W), 
                            rowsums_byname(Y) %>% 
                              setcolnames_byname("Industry") %>% setcoltype("Industry")),
    EBalOK = iszero_byname(err)
  )
Check %>% select(Country, Year, EBalOK)
all(Check$EBalOK %>% as.logical())

## ------------------------------------------------------------------------
Etas <- Energy %>% 
  mutate(
    g = rowsums_byname(V),
    eta = transpose_byname(U) %>% rowsums_byname() %>% 
      hatize_byname() %>% invert_byname() %>% 
      matrixproduct_byname(g) %>% 
      setcolnames_byname("eta") %>% setcoltype("Efficiency")
  ) %>% 
  select(Country, Year, eta)

Etas$eta[[1]]

## ------------------------------------------------------------------------
etas_forgraphing <- Etas %>% 
  gather(key = matrix.names, value = matrix, eta) %>% 
  expand_to_tidy(matnames = "matrix.names", matvals = "matrix", 
                 rownames = "Industry", colnames = "etas", 
                 rowtypes = "rowtype", coltypes = "Efficiencies") %>% 
  mutate(
    # Eliminate columns we no longer need.
    matrix.names = NULL,
    etas = NULL, 
    rowtype = NULL, 
    Efficiencies = NULL
  ) %>% 
  rename(
    eta = matrix
  )

# Compare to Figure 8 of Heun, Owen, and Brockway (2018)
etas_forgraphing %>% filter(Country == "GB", Year == 2000)

## ------------------------------------------------------------------------
etas_UK_2000 <- etas_forgraphing %>% filter(Country == "GB", Year == 2000) 

etas_UK_2000 %>% 
  ggplot(mapping = aes_string(x = "Industry", y = "eta", 
                              fill = "Industry", colour = "Industry")) + 
  geom_bar(stat = "identity") +
  labs(x = NULL, y = expression(eta[UK*","*2000]), fill = NULL) + 
  scale_y_continuous(breaks = seq(0, 1, by = 0.2)) +
  scale_fill_manual(values = rep("white", nrow(etas_UK_2000))) +
  scale_colour_manual(values = rep("gray20", nrow(etas_UK_2000))) + 
  guides(fill = FALSE, colour = FALSE) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.4, hjust = 1))

