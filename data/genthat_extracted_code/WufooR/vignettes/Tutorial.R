## ---- eval=FALSE, include=T----------------------------------------------
#  library(WufooR)
#  
#  options(Wufoo_Name = "johnmalc", Wufoo_API = "put here your api key")

## ---- eval=FALSE, include=T----------------------------------------------
#  auth_name(NULL)
#  auth_key(NULL)

## ---- eval=FALSE, include=T----------------------------------------------
#  t(user_info())

## ---- eval=FALSE, include=T----------------------------------------------
#  t(form_info())
#  
#  # Show responses to the form
#  fe_1 <- form_entries(formIdentifier = "z5kqx7h1gtvg4g")
#  t(fe_1)
#  
#  sapply(fe_1, class)

## ---- eval=FALSE, include=T----------------------------------------------
#  # How many responses did you get ?
#  form_entriesCount(formIdentifier = "z5kqx7h1gtvg4g", domain = "wufoo.eu")

## ---- eval=FALSE, include=T----------------------------------------------
#  fields_info(formIdentifier = "z5kqx7h1gtvg4g", showRequestURL = TRUE)

## ---- eval=FALSE, include=T----------------------------------------------
#  t(reports_info())

