## ---- eval=FALSE---------------------------------------------------------
#   library(skynet)
#   import_db1b("folder/Coupon 2016Q1.csv", "folder/Ticket 2016Q1.csv")
#   import_t100("folder/T100_2016.csv")

## ---- echo=FALSE, message=FALSE, warning=FALSE, results='asis'-----------
knitr::kable(data.frame(Coupon = c("Itinerary ID", "Market ID", "Sequence Number", "Origin City Market ID",  
"Origin", "Year", "Quarter", "Destination City Market ID", "Destination", "Trip Break", "Operating Carrier", 
"Distance", "Gateway"),
Ticket = c("Itinerary ID", "Roundtrip", "Itinerary Yield", "Passengers",
"Itinerary Fare", "Bulkfare Indicator", "Distance Full","","","","","","")))

## ---- echo=FALSE, message=FALSE, warning=FALSE, results='asis'-----------
library(skynet)
library(dplyr)
library(kableExtra)
options(knitr.table.format = "html") 
data("OD_Sample")
rownames(OD_Sample) <- NULL
knitr::kable(head(OD_Sample, 5)) %>% kable_styling()

## ---- echo=FALSE, message=FALSE, warning=FALSE,dpi = 300, fig.width = 6, fig.height= 4, out.width=500----
library(skynet)
data("OD_Sample")
test <- make_net_dir(OD_Sample)
net_map(test, pct = 10)

## ------------------------------------------------------------------------
library(skynet)
test <- make_net_dir(OD_Sample)
boot_network(test$gDir, n = 10)

