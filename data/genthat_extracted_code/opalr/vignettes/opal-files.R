## ----eval=FALSE----------------------------------------------------------
#  library(opalr)
#  o <- opal.login("administrator", "password", "https://opal-demo.obiba.org")

## ----eval=FALSE----------------------------------------------------------
#  opal.file_download(o, "/tmp/datashield.zip")

## ----eval=FALSE----------------------------------------------------------
#  opal.file_download(o, "/tmp/datashield.zip", "datashield-encrypted.zip", key="ABCDEFGHIJKL")

## ----eval=FALSE----------------------------------------------------------
#  opal.file_upload(o, "datashield.zip", "/projects/datashield")

## ----eval=FALSE----------------------------------------------------------
#  fooDir <- paste0("/projects/datashield/foo-", sample(10000:99999, 1))
#  opal.file_mkdir(o, fooDir)
#  opal.file_ls(o, "/projects/datashield")

## ----eval=FALSE----------------------------------------------------------
#  opal.file_mv(o, "/projects/datashield/datashield.zip", fooDir)
#  opal.file_ls(o, fooDir)

## ----eval=FALSE----------------------------------------------------------
#  barDir <- paste0("/projects/datashield/bar-", sample(10000:99999, 1))
#  opal.file_mv(o, fooDir, barDir)
#  opal.file_ls(o, "/projects/datashield")

## ----eval=FALSE----------------------------------------------------------
#  opal.file_write(o, paste0(barDir, "/datashield.zip"))
#  opal.execute(o, "list.files()")

## ----eval=FALSE----------------------------------------------------------
#  opal.file_read(o, "datashield.zip", paste0(barDir, "/ds.zip"))
#  opal.file_ls(o, barDir)

## ----eval=FALSE----------------------------------------------------------
#  opal.file_rm(o, barDir)
#  opal.file_ls(o, "/projects/datashield")

## ----eval=FALSE----------------------------------------------------------
#  # clean server side
#  opal.logout(o)
#  # clean client side
#  unlink("datashield-encrypted.zip")
#  unlink("datashield.zip")

