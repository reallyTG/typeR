## ----setup, echo=FALSE---------------------------------------------------
library("billboarder")

## ------------------------------------------------------------------------
data("prod_par_filiere")
str(prod_par_filiere)

## ------------------------------------------------------------------------
billboarder() %>% 
  bb_barchart(data = prod_par_filiere[, c("annee", "prod_bioenergies")])

## ------------------------------------------------------------------------
billboarder() %>% 
  bb_linechart(data = prod_par_filiere[, c("annee", "prod_bioenergies")])

## ------------------------------------------------------------------------
billboarder(data = prod_par_filiere) %>% 
  bb_aes(x = annee, y = prod_bioenergies) %>% 
  bb_barchart()

## ------------------------------------------------------------------------
billboarder(data = prod_par_filiere) %>% 
  bb_aes(x = annee, y = prod_bioenergies) %>% 
  bb_linechart()

## ------------------------------------------------------------------------
billboarder(data = prod_par_filiere) %>% 
  bb_barchart(mapping = bbaes(x = annee, y = prod_bioenergies))

## ------------------------------------------------------------------------
billboarder(data = prod_par_filiere) %>% 
  bb_linechart(mapping = bbaes(x = annee, y = prod_bioenergies))

## ------------------------------------------------------------------------
billboarder() %>% 
  bb_barchart(
    data = prod_par_filiere[, c("annee", "prod_bioenergies", "prod_eolien", "prod_solaire", "prod_hydraulique")]
  )

## ------------------------------------------------------------------------
# prepare data
data("prod_filiere_long")
prod_filiere_long <- prod_filiere_long[
  prod_filiere_long$branche %in% c("bioenergies", "eolien", "solaire", "hydraulique"), 
]
head(prod_filiere_long)


billboarder(data = prod_filiere_long) %>% 
  bb_barchart(mapping = bbaes(x = annee, y = prod, group = branche))

## ------------------------------------------------------------------------
billboarder(data = prod_filiere_long) %>% 
  bb_barchart(mapping = bbaes_string(x = "annee", y = "prod", group = "branche"))

