## ----eval=FALSE----------------------------------------------------------
#  library(opalr)
#  o <- opal.login("administrator", "password", "https://opal-demo.obiba.org")

## ----eval=FALSE----------------------------------------------------------
#  opal.projects(o)

## ----eval=FALSE----------------------------------------------------------
#  opal.datasources(o)

## ----eval=FALSE----------------------------------------------------------
#  opal.tables(o, datasource = "CPTP", counts = TRUE)

## ----eval=FALSE----------------------------------------------------------
#  opal.variables(o, datasource = "CPTP", table = "Coreqx_final")

## ----eval=FALSE----------------------------------------------------------
#  opal.valueset(o, datasource = "FNAC", table = "FNAC", identifier = "1000502517535681229")

## ----eval=FALSE----------------------------------------------------------
#  opal.taxonomies(o)

## ----eval=FALSE----------------------------------------------------------
#  opal.vocabularies(o, taxonomy = "Mlstr_area")

## ----eval=FALSE----------------------------------------------------------
#  opal.terms(o, taxonomy = "Mlstr_area", vocabulary = "Lifestyle_behaviours")

## ----eval=FALSE----------------------------------------------------------
#  opal.logout(o)

