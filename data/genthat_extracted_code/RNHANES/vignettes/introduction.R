## ---- include=FALSE------------------------------------------------------

NOT_CRAN <- identical(tolower(Sys.getenv("NOT_CRAN")), "true")
knitr::opts_chunk$set(purl = NOT_CRAN)

NOT_CRAN = FALSE

if(NOT_CRAN) {
  options(NHANES_destination = "./data/")
  options(NHANES_cache = TRUE)
}


## ---- results='hide', message=FALSE, error=FALSE-------------------------
library(RNHANES)

## ---- results='hide', message=FALSE, cache=TRUE, eval=NOT_CRAN-----------
#  
#  files <- nhanes_data_files()
#  variables <- nhanes_variables()
#  

## ---- eval=FALSE---------------------------------------------------------
#  nhanes_search(files, "environmental phenols")
#  nhanes_search(files, "pesticides", component == "laboratory", cycle == "2003-2004")
#  nhanes_search(files, "", cycle == "2003-2004")
#  
#  nhanes_search(variables, "triclosan")
#  nhanes_search(variables, "DDT", data_file_name == "LAB28POC")
#  nhanes_search(variables, "", data_file_name == "EPH_E")

## ---- results='hide', eval=FALSE, cache=TRUE-----------------------------
#  nhanes_load_data("EPH_E", "2007-2008")

## ---- results='hide', eval=FALSE-----------------------------------------
#  nhanes_load_data("EPH", "2007-2008")

## ---- eval=FALSE---------------------------------------------------------
#  nhanes_load_data("EPH", "2007-2008", cache = "./nhanes_data")

## ---- results='hide', eval=FALSE-----------------------------------------
#  nhanes_load_data("EPH", "2007-2008", cache = "./nhanes_data", demographics = TRUE)

## ---- eval=FALSE---------------------------------------------------------
#  nhanes_load_data("EPH", "2007-2008", cache = "./nhanes_data", demographics = TRUE, recode = TRUE)

## ---- eval=FALSE---------------------------------------------------------
#  nhanes_load_data(c("PHTHTE", "PFC"), c("2007-2008", "2007-2008"))

## ---- eval=FALSE---------------------------------------------------------
#  
#  # Search for NHANES files related to environmental phenols and download all of them
#  results <- nhanes_search(files, "environmental phenols")
#  nhanes_load_data(results$data_file_name, results$cycle)
#  
#  # Search for triclosan NHANES variables and download all related files
#  results <- nhanes_search(variables, "triclosan")
#  nhanes_load_data(results$data_file_name, results$cycle)

## ---- results='hide', message=FALSE, cache=TRUE, eval=NOT_CRAN-----------
#  # Example of data loaded from one file/cycle year
#  phenols <- nhanes_load_data("EPH", "2007-2008", demographics = TRUE)
#  
#  # Example of data loaded from multiple files/cycle years
#  # Download all files that contain a "triclosan" variable
#  results <- nhanes_search(variables, "triclosan")
#  triclosan <- nhanes_load_data(results$data_file_name, results$cycle, demographics = TRUE)
#  

## ---- cache=TRUE, eval=NOT_CRAN------------------------------------------
#  nhanes_quantile(phenols, "URXBPH", "URDBPHLC", "WTSB2YR", c(0.5, 0.95, 0.99))

## ---- cache=TRUE, eval=NOT_CRAN------------------------------------------
#  nhanes_quantile(phenols,
#                  c("URXBPH", "URXTRS"),
#                  c("URDBPHLC", "URDTRSLC"),
#                  c("WTSB2YR", "WTSB2YR"),
#                  c(0.5, 0.95, 0.99))

## ---- cache=TRUE, eval=NOT_CRAN------------------------------------------
#  
#  inputs <- as.data.frame(matrix(c(
#    # COLUMN    COMMENT     WEIGHTS
#     "URXBPH", "URDBPHLC", "WTSB2YR",
#     "URXTRS", "URDTRSLC", "WTSB2YR"
#  ), ncol = 3, byrow = TRUE), stringsAsFactors = FALSE)
#  names(inputs) <- c("column", "comment_column", "weights_column")
#  
#  nhanes_quantile(phenols, inputs, quantiles = c(0.5, 0.95, 0.99))
#  

## ---- eval=FALSE, cache=TRUE, eval=NOT_CRAN------------------------------
#  inputs <- as.data.frame(matrix(c(
#    # CYCLE        COLUMN    COMMENT     WEIGHTS
#     "2003-2004", "URDTRS", "URDTRSLC", "WTSC2YR",
#     "2005-2006", "URXTRS", "URDTRSLC", "WTSB2YR",
#     "2007-2008", "URXTRS", "URDTRSLC", "WTSB2YR",
#     "2009-2010", "URXTRS", "URDTRSLC", "WTSB2YR",
#     "2011-2012", "URXTRS", "URDTRSLC", "WTSA2YR"
#  ), ncol = 4, byrow = TRUE), stringsAsFactors = FALSE)
#  names(inputs) <- c("cycle", "column", "comment_column", "weights_column")
#  
#  nhanes_quantile(triclosan, inputs, quantiles = c(0.5, 0.95, 0.99))

## ---- cache=TRUE, eval=NOT_CRAN------------------------------------------
#  nhanes_detection_frequency(phenols, "URXBPH", "URDBPHLC", "WTSB2YR")

## ---- eval=NOT_CRAN------------------------------------------------------
#  nhanes_detection_frequency(phenols, c("URXBPH", "URXTRS"),
#                  c("URDBPHLC", "URDTRSLC"),
#                  c("WTSB2YR", "WTSB2YR"))

## ---- eval=NOT_CRAN------------------------------------------------------
#  inputs <- as.data.frame(matrix(c(
#    # CYCLE        COLUMN    COMMENT     WEIGHTS
#     "2003-2004", "URDTRS", "URDTRSLC", "WTSC2YR",
#     "2005-2006", "URXTRS", "URDTRSLC", "WTSB2YR",
#     "2007-2008", "URXTRS", "URDTRSLC", "WTSB2YR",
#     "2009-2010", "URXTRS", "URDTRSLC", "WTSB2YR",
#     "2011-2012", "URXTRS", "URDTRSLC", "WTSA2YR"
#  ), ncol = 4, byrow = TRUE), stringsAsFactors = FALSE)
#  names(inputs) <- c("cycle", "column", "comment_column", "weights_column")
#  
#  nhanes_detection_frequency(triclosan, inputs)

## ---- eval=NOT_CRAN------------------------------------------------------
#  nhanes_sample_size(phenols, "URXBPH", "URDBPHLC", "WTSB2YR")

## ---- cache=TRUE, eval=NOT_CRAN------------------------------------------
#  library(survey)
#  
#  nhanes_survey(svymean, phenols, "URXBPH", "URDBPHLC", "WTSB2YR", na.rm = TRUE)
#  

## ---- eval=NOT_CRAN------------------------------------------------------
#  nhanes_hist(phenols, "URXBPH", "URDBPHLC", "WTSB2YR")

## ---- eval=NOT_CRAN------------------------------------------------------
#  nhanes_hist(phenols, "URXBPH", "URDBPHLC", "WTSB2YR", transform="log")

