## ----load, warning=FALSE, include=TRUE-----------------------------------
# load Cluster.OBeu
library(Cluster.OBeu)

## ----data----------------------------------------------------------------
aragon_income = "http://apps.openbudgets.eu/api/3/cubes/aragon-2007-income__3209b/aggregate?drilldown=fundingClassification.prefLabel%7CeconomicClassification.prefLabel&aggregates=amount.sum"

## ----open_spending, eval=FALSE, message=FALSE, warning=FALSE, include=TRUE----
#  results = open_spending.cl(
#    json_data =  aragon_income,
#    dimensions ="economicClassification.prefLabel",
#    amounts = "amount.sum",
#    measured.dimensions = "fundingClassification.prefLabel",
#    cl.method="kmeans"
#    )
#  # Pretty output using prettify of jsonlite library
#  jsonlite::prettify(results)

## ---- eval=FALSE, include=TRUE-------------------------------------------
#  ../library/Cluster.OBeu/R/open_spending.cl
#  # library/ {name of the library} /R/ {function}

