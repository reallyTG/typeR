## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
library(PKNCA)

## ----options, echo=FALSE, results='asis'---------------------------------
PKNCA.options(default=TRUE)
opts <- PKNCA.options()
for (n in names(opts)) {
  cat("## ", n, "\n", sep="")
  cat("\n")
  cat(PKNCA:::PKNCA.options.describe(n), "\n", sep="")
  cat("\n")
  if (is.character(opts[[n]]) | is.numeric(opts[[n]]) | is.factor(opts[[n]]) | is.logical(opts[[n]])) {
    cat("The default value is: ", opts[[n]], "\n", sep="")
  } else if (is.data.frame(opts[[n]])) {
    print(knitr::kable(opts[[n]]))
  } else {
    # Probably a list
    print(opts[[n]])
  }
  cat("\n")
}

