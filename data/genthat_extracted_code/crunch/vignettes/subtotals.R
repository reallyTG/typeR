## ----load data, include=FALSE-----------------------------------------------------------------------------------------
## Because the vignette tasks require communicating with a remote host,
## we do all the work ahead of time and save a workspace, which we load here.
## We'll then reference saved objects in that as if we had just retrieved them
## from the server
library(crunch)
load("vignettes.RData")
options(width=120)

## ----no subtotals, eval=FALSE-----------------------------------------------------------------------------------------
#  subtotals(ds$obamaapp)

## ----no subtotals print, echo = FALSE---------------------------------------------------------------------------------
sub_initial_subtotals

## ----add some subtotals, eval = FALSE---------------------------------------------------------------------------------
#  subtotals(ds$DiversityImportant) <- list(
#      Subtotal(name = "Follows closely",
#               categories = c("Strongly closely", "Very closely"),
#               after = "Somewhat closely"),
#      Subtotal(name = "Generally disagree",
#               categories = c("Not very closely", "Not at all"),
#               after = "Not at all")
#  )

## ----new subtotals, eval = FALSE--------------------------------------------------------------------------------------
#  subtotals(ds$manningknowledge)

## ---- echo = FALSE----------------------------------------------------------------------------------------------------
sub_subtotals1

## ----crunch app output, echo = FALSE----------------------------------------------------------------------------------
knitr::include_graphics("images/manning_knowledge_subtotals.png")


## ----add some headings, eval = FALSE----------------------------------------------------------------------------------
#  subtotals(ds$obamaapp) <- list(
#      Heading(name = "Approves",
#              after = 0),
#      Heading(name = "Disapprove",
#              after = "Somewhat Approve"),
#      Heading(name = "No Answer",
#              after = "Strongly Disapprove")
#  )
#  
#  subtotals(ds$obamaapp)

## ----headings out, echo = FALSE---------------------------------------------------------------------------------------
sub_headings

## ----crunch app output headings, echo = FALSE-------------------------------------------------------------------------
knitr::include_graphics("images/obama_headings.png")


## ----remove some headings, eval = FALSE-------------------------------------------------------------------------------
#  subtotals(ds$YearsCodedJob) <- NULL

## ----remove headings out, echo = FALSE--------------------------------------------------------------------------------
sub_initial_subtotals

## ----save some subtotals, eval = FALSE--------------------------------------------------------------------------------
#  approve_subtotals <- list(
#      Subtotal(name = "Approves",
#              categories = c("Somewhat approve", "Strongly approve"),
#              after = "Somewhat approve"),
#      Subtotal(name = "Disapprove",
#              categories = c("Somewhat disapprove", "Strongly disapprove"),
#              after = "Strongly disapprove"))

## ----check some categories, eval = FALSE------------------------------------------------------------------------------
#  subtotals(ds$snowdenleakapp) <- approve_subtotals
#  subtotals(ds$congapp) <- approve_subtotals

## ----show some categories, eval = FALSE-------------------------------------------------------------------------------
#  subtotals(ds$snowdenleakapp)
#  subtotals(ds$congapp)

## ----show categories out, echo = FALSE--------------------------------------------------------------------------------
sub_snowdon
sub_con

## ----show subtotals, eval= FALSE--------------------------------------------------------------------------------------
#  crtabs(~congapp + gender, data = ds)

## ----show subtotals out, echo = FALSE---------------------------------------------------------------------------------
sub_crtab

## ----show subtotals only, eval = FALSE--------------------------------------------------------------------------------
#  subtotalArray(crtabs(~congapp + gender, data = ds))

## ----show subtotals only out, echo = FALSE----------------------------------------------------------------------------
subtotalArray(sub_crtab)

## ----noTransforms, eval = FALSE---------------------------------------------------------------------------------------
#  noTransforms(crtabs(~congapp + gender, data = ds))

## ---- echo = FALSE----------------------------------------------------------------------------------------------------
noTransforms(sub_crtab)

