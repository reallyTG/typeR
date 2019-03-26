## ----eval=FALSE----------------------------------------------------------
#  library(opalr)
#  o <- opal.login("administrator", "password", "https://opal-demo.obiba.org")

## ----eval=FALSE----------------------------------------------------------
#  opal.assign.table(o, symbol = "df", value = "datashield.CNSIM1")

## ----eval=FALSE----------------------------------------------------------
#  opal.assign.table.tibble(o, symbol = "tbl", value = "datashield.CNSIM1")

## ----eval=FALSE----------------------------------------------------------
#  opal.symbols(o)

## ----eval=FALSE----------------------------------------------------------
#  opal.execute(o, script = "names(tbl)")

## ----eval=FALSE----------------------------------------------------------
#  tbl <- opal.execute(o, script = "tbl")

## ----eval=FALSE----------------------------------------------------------
#  opal.workspace_save(o, save="cnsim1")
#  opal.workspaces(o)

## ----eval=FALSE----------------------------------------------------------
#  opal.logout(o)

