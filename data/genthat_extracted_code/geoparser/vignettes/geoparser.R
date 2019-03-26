## ---- echo = FALSE, warning=FALSE, message=FALSE-------------------------
NOT_CRAN <- identical(tolower(Sys.getenv("NOT_CRAN")), "true")
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  purl = NOT_CRAN,
  eval = NOT_CRAN
)

## ---- message=FALSE, warning=FALSE---------------------------------------
library("geoparser")
output <- geoparser_q("I was born in Vannes and I live in Barcelona")


## ---- message=FALSE, warning=FALSE---------------------------------------
output$properties


## ---- message=FALSE, warning=FALSE---------------------------------------
knitr::kable(output$results)


## ---- message=FALSE, warning=FALSE---------------------------------------
library("geoparser")
output_v <- geoparser_q(text_input = c("I was born in Vannes but I live in Barcelona.",
"France is the most beautiful place in the world.", "No place here."))
knitr::kable(output_v$results)
knitr::kable(output_v$properties)

## ------------------------------------------------------------------------
output2 <- geoparser_q("I like Paris and Paris and Paris and yeah it is in France!")
knitr::kable(output2$results)


## ------------------------------------------------------------------------
output_nothing <- geoparser_q("No placename can be found.")
output_nothing$results


## ------------------------------------------------------------------------
output3 <- geoparser_q("I live in Hyderabad, India. My mother would prefer living in Hyderabad near Islamabad!")
knitr::kable(output3$results)


## ------------------------------------------------------------------------
text <- "Aliwagwag is situated in the Eastern Mindanao Biodiversity \
Corridor which contains one of the largest remaining blocks of tropical lowland \
rainforest in the Philippines. It covers an area of 10,491.33 hectares (25,924.6 \
acres) and a buffer zone of 420.6 hectares (1,039 acres) in the hydrologically \
rich mountainous interior of the municipalities of Cateel and Boston in Davao \
Oriental as well as a portion of the municipality of Compostela in Compostela \
Valley. It is also home to the tallest trees in the Philippines, the Philippine \
rosewood, known locally as toog. In the waters of the upper Cateel River, a rare \
species of fish can be found called sawugnun by locals which is harvested as a \
delicacy." 

output4 <- geoparser_q(text)
knitr::kable(output4$results)

