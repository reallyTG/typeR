## ---- message=FALSE------------------------------------------------------
library(crunch)

## ---- results='hide', include = FALSE------------------------------------
library(httptest)
start_vignette("crunch")
login()

## ----login, eval=FALSE---------------------------------------------------
#  login("xkcd@crunch.io")

## ----dimensions----------------------------------------------------------
dim(SO_survey)

## ----load dataset, message=FALSE-----------------------------------------
ds <- newDataset(SO_survey, name="Stack Overflow Developer Survey 2017")
dim(ds)

## ----get dataset description---------------------------------------------
name(ds)
description(ds)

## ----state change2, include=FALSE----------------------------------------
change_state()

## ----set description-----------------------------------------------------
description(ds) <- "Subset of the main survey, restricted to self-reported R users"
description(ds)

## ----variable examples---------------------------------------------------
ds$TabsSpaces
ds[, "CompanySize"]

## ----state change3, include=FALSE----------------------------------------
change_state()

## ----variable descriptions-----------------------------------------------
descriptions(variables(ds)) <- SO_schema$Question
description(ds$CompanySize)

## ----open variable, eval = FALSE-----------------------------------------
#  webApp(ds$CompanySize)

## ----open variable screen, echo = FALSE----------------------------------
knitr::include_graphics("images/crunch-companySize-screen.png")

## ----categorical arrays--------------------------------------------------
ds$ImportantHiringCompanies
ds$ImportantHiringAlgorithms

## ----grep subvars--------------------------------------------------------
imphire <- grep("^ImportantHiring", names(ds), value = TRUE)
imphire

## ----state change4, include=FALSE----------------------------------------
change_state()

## ----makeArray-----------------------------------------------------------
ds$ImportantHiring <- makeArray(ds[imphire], name = "Importance in Hiring Process")

## ------------------------------------------------------------------------
subvariables(ds$ImportantHiring)

## ----state change5, include=FALSE----------------------------------------
change_state()

## ------------------------------------------------------------------------
description(ds$ImportantHiring) <- sub("^(.*\\?).*$", "\\1",
    descriptions(subvariables(ds$ImportantHiring))[1])
names(subvariables(ds$ImportantHiring)) <- sub("^.*\\? (.*)$", "\\1",
    descriptions(subvariables(ds$ImportantHiring)))

subvariables(ds$ImportantHiring)

## ----View array, eval = FALSE--------------------------------------------
#  webApp(ds$ImportantHiring)

## ----View array screen, echo = FALSE-------------------------------------
knitr::include_graphics("images/crunch-importantHiringCA.png")

## ------------------------------------------------------------------------
knitr::kable(SO_survey[1:5, "HaveWorkedLanguage", drop = FALSE], row.names = FALSE)

## ----state change6, include=FALSE----------------------------------------
change_state()

## ----makeMRFromText------------------------------------------------------
ds$WantWorkLanguageMR <- makeMRFromText(ds$WantWorkLanguage,
    delim = "; ",
    name = "Languages Desired for Work",
    description = description(ds$WantWorkLanguage))

## ----MR table------------------------------------------------------------
table(ds$WantWorkLanguageMR)

## ----reorder subvariables------------------------------------------------
counts <- sort(table(ds$WantWorkLanguageMR), decreasing = TRUE)
subvariables(ds$WantWorkLanguageMR) <- subvariables(ds$WantWorkLanguageMR)[names(counts)]

## ----echo = FALSE--------------------------------------------------------
knitr::include_graphics("images/WantWorkMRReodered.png")

## ---- include=FALSE------------------------------------------------------
logout()
end_vignette()

