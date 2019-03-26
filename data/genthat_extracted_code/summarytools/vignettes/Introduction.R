## ----setup, include=FALSE------------------------------------------------
library(knitr)
opts_chunk$set(comment=NA, prompt=FALSE, cache=FALSE, results='asis')
library(summarytools)
st_options('footnote', NA)

## ------------------------------------------------------------------------
library(summarytools)
freq(iris$Species, style = "rmarkdown")

## ------------------------------------------------------------------------
freq(iris$Species, report.nas = FALSE, style = "rmarkdown", omit.headings = TRUE)

## ------------------------------------------------------------------------
with(tobacco, print(ctable(smoker, diseased), method = 'render'))

## ------------------------------------------------------------------------
with(tobacco, 
     print(ctable(smoker, diseased, prop = 'n', totals = FALSE), 
           omit.headings = TRUE, method = "render"))

## ------------------------------------------------------------------------
descr(iris, style = "rmarkdown")

## ------------------------------------------------------------------------
descr(iris, stats = c("mean", "sd", "min", "med", "max"), transpose = TRUE, 
      omit.headings = TRUE, style = "rmarkdown")

## ---- eval=FALSE---------------------------------------------------------
#  view(dfSummary(iris))

## ------------------------------------------------------------------------
dfSummary(tobacco, plain.ascii = FALSE, style = "grid")

## ------------------------------------------------------------------------
# First save the results
iris_stats_by_species <- by(data = iris, 
                            INDICES = iris$Species, 
                            FUN = descr, stats = c("mean", "sd", "min", "med", "max"), 
                            transpose = TRUE)

# Then use view(), like so:
view(iris_stats_by_species, method = "pander", style = "rmarkdown")

## ---- eval=FALSE---------------------------------------------------------
#  view(iris_stats_by_species)

## ------------------------------------------------------------------------
data(tobacco) # tobacco is an example dataframe included in the package
BMI_by_age <- with(tobacco, 
                   by(BMI, age.gr, descr, 
                      stats = c("mean", "sd", "min", "med", "max")))
view(BMI_by_age, "pander", style = "rmarkdown")

## ------------------------------------------------------------------------
BMI_by_age <- with(tobacco, 
                   by(BMI, age.gr, descr,  transpose = TRUE,
                      stats = c("mean", "sd", "min", "med", "max")))
view(BMI_by_age, "pander", style = "rmarkdown", omit.headings = TRUE)

## ---- eval=FALSE---------------------------------------------------------
#  tobacco_subset <- tobacco[ ,c("gender", "age.gr", "smoker")]
#  freq_tables <- lapply(tobacco_subset, freq)
#  view(freq_tables, footnote = NA, file = 'freq-tables.html')

## ---- eval=FALSE, tidy=FALSE---------------------------------------------
#      knitr::opts_chunk$set(echo = TRUE, results = 'asis')

## ---- eval=FALSE---------------------------------------------------------
#  view(iris_stats_by_species, file = "~/iris_stats_by_species.html")

## ---- eval=FALSE---------------------------------------------------------
#  st_options()                      # display all global options' values
#  st_options('round.digits')        # display only one option
#  st_options('omit.headings', TRUE) # change an option's value
#  st_options('footnote', NA)        # Turn off the footnote on all outputs.
#                                    # This option was used prior to generating
#                                    # the present document.

## ------------------------------------------------------------------------
age_stats <- freq(tobacco$age.gr)  # age_stats contains a regular output for freq 
                                   # including headings, NA counts, and Totals
print(age_stats, style = "rmarkdown", report.nas = FALSE, 
                 totals = FALSE, omit.headings = TRUE)

## ---- eval=FALSE---------------------------------------------------------
#  view(dfSummary(tobacco), custom.css = 'path/to/custom.css',
#       table.classes = 'table-condensed')

## ----what_is, warning=FALSE, results='markup'----------------------------
what.is(iris)

