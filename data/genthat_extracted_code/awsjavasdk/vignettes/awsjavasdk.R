## ---- echo = FALSE, results='asis'---------------------------------------
# Include badges only when making the github markdown
library(knitr)
if ("github_markdown" %in% knitr::opts_knit$get("rmarkdown.pandoc.to")) {
  cat("
[![License](http://img.shields.io/badge/license-GPL%20%28%3E=%202%29-brightgreen.svg?style=flat)](http://www.gnu.org/licenses/gpl-2.0.html)
[![Travis-CI Build Status](https://travis-ci.org/zapier/awsjavasdk.svg?branch=master)](https://travis-ci.org/zapier/awsjavasdk)
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/awsjavasdk)](https://cran.r-project.org/package=awsjavasdk)
[![codecov.io](https://codecov.io/github/zapier/awsjavasdk/coverage.svg?branch=master)](https://codecov.io/github/zapier/awsjavasdk?branch=master)
")
}

## ---- echo = FALSE, results = 'hide', message = FALSE--------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.path = "README-"
)

