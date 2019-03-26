## ----echo=FALSE----------------------------------------------------------
NOT_CRAN <- identical(tolower(Sys.getenv("NOT_CRAN")), "true")
pat <- Sys.getenv("CORE_KEY")
IS_THERE_KEY <- (pat != "")
NOT_CRAN <- ifelse(IS_THERE_KEY, NOT_CRAN, FALSE)

knitr::opts_chunk$set(
  comment = "#>",
  collapse = TRUE,
  warning = FALSE,
  message = FALSE,
  purl = NOT_CRAN,
  eval = NOT_CRAN
)

## ----eval=FALSE----------------------------------------------------------
#  install.packages("rcoreoa")

## ----eval=FALSE----------------------------------------------------------
#  devtools::install_github("ropensci/rcoreoa")

## ------------------------------------------------------------------------
library("rcoreoa")

## ---- echo=TRUE, results=FALSE-------------------------------------------
Sys.getenv("CORE_KEY")

## ------------------------------------------------------------------------
api_key <- Sys.getenv('CORE_KEY')
core_journals(id = '2167-8359', key = api_key)

## ------------------------------------------------------------------------
core_journals_(id = '2167-8359', key = api_key)

## ------------------------------------------------------------------------
palyn <- core_search(query = 'palynology', key = api_key)

## ------------------------------------------------------------------------

# Define a data.frame with a row per year bin.
query <- data.frame(
  all_of_the_words = "palynology",
  year_from = as.character(seq(1950, 2016)),
  year_to   = as.character(seq(1951, 2017)),
  stringsAsFactors = FALSE)

paly_bins <- core_advanced_search(query = query, key = api_key)

plot(seq(1951, 2017), paly_bins[[2]],
     xlab = "Published Year", ylab = "Articles", type = 'l')


## ------------------------------------------------------------------------

query <- data.frame(
  all_of_the_words = "and",
  year_from = as.character(seq(1950, 2016)),
  year_to   = as.character(seq(1951, 2017)),
  stringsAsFactors = FALSE)

control_bins <- core_advanced_search(query = query, key = api_key)

plot(seq(1951, 2017), control_bins[[2]] / max(control_bins[[2]]),
     xlab = "Published Year", ylab = "Articles", lty = 2, col = 'red', type = 'l')
lines(seq(1951, 2017), paly_bins[[2]] / max(paly_bins[[2]]))


## ------------------------------------------------------------------------

ann_query <- function(string, control = NULL) {
  
  query <- data.frame(
    all_of_the_words = string,
    year_from = as.character(seq(1950, 2016)),
    year_to   = as.character(seq(1951, 2017)),
    stringsAsFactors = FALSE)

  hit_bins <- core_advanced_search(query = query, key = api_key)
  
  if (is.null(control)) control = hit_bins
  
  return(data.frame(years = seq(1951, 2017), 
                    hits = hit_bins[[2]], 
                    transformed = hit_bins[[2]] / control[[2]],
                    string = string, 
                    stringsAsFactors = FALSE))
}

string_sets <- do.call(rbind.data.frame, 
                       lapply(c("and", "palynology", "paleoecology", "palaeoecology"), 
                              ann_query, control = control_bins))

string_sets <- string_sets[!string_sets$string %in% 'and',]

plot(data = string_sets, 
     transformed ~ years, 
     col = factor(string_sets$string),
     pch = 19, cex = 0.5)


