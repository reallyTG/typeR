## ----load, warning=FALSE, include=TRUE-----------------------------------
# load DescriptiveStats.OBeu
library(DescriptiveStats.OBeu)

## ----data----------------------------------------------------------------
Wuppertal_openspending

## ----open_spending-------------------------------------------------------
descript = open_spending.ds(
  json_data =  Wuppertal_openspending, 
  dimensions ="functional_classification_3.Produktgruppe|date_2.Year",
  amounts = "Amount"
  )
# Pretty output using prettify of jsonlite library
jsonlite::prettify(descript)

## ---- eval=FALSE, include=TRUE-------------------------------------------
#  ../library/DescriptiveStats.OBeu/R/open_spending.ds
#  # library/ {name of the library} /R/ {function}

