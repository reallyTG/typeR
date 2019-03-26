## ---- message=FALSE, warning=FALSE---------------------------------------
library(realestateDK); library(dplyr); library(statsDK); library(ggplot2)

## ------------------------------------------------------------------------
ls("package:realestateDK")

## ------------------------------------------------------------------------
table_vars("BM010")

## ------------------------------------------------------------------------
my_data <- BM010(EJKAT20 = "2", OMR20 = "00", PRIS20 = "REAL", Tid = "*")

## ------------------------------------------------------------------------
glimpse(my_data)

## ------------------------------------------------------------------------
my_data$TID <- fix_time(my_data$TID)

glimpse(my_data)

## ------------------------------------------------------------------------
ggplot(my_data) + 
  geom_line(aes(x = TID, y = INDHOLD)) + 
  labs(x = "", y = "Apartment prices in Denmark") +
  theme_minimal()

## ------------------------------------------------------------------------
metadata <- attributes(my_data)$metadata

glimpse(metadata)

