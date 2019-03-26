## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ----declare, echo=F-----------------------------------------------------

## ----install-codified----------------------------------------------------
if( !requireNamespace("codified", quietly=T) )
  devtools::install_github(repo= "OuhscBbmc/codified")

library(codified)

## ----local-establish-----------------------------------------------------
library(magrittr)

path <- system.file("misc/example-data-1.csv", package="codified")
col_types <- readr::cols_only(
  record_id = readr::col_integer(),
  name_last = readr::col_character(),
  dob       = readr::col_date(format = ""),
  gender    = readr::col_integer(),
  race      = readr::col_integer(),
  ethnicity = readr::col_integer()
)
ds <- readr::read_csv(path, col_types=col_types) %>%
  dplyr::mutate(
    gender     = as.character(gender),
    race       = as.character(race),
    ethnicity  = as.character(ethnicity)
  )
ds %>% 
  head(10) %>% 
  knitr::kable(caption = "Observed Dataset (first ten rows)")

ds_lu_gender <- tibble::tribble(
  ~input,   ~displayed            ,
  "0"   ,  "Female"               , 
  "1"   ,  "Male"                 ,
  "U"   ,  "Unknown/Not Reported"
)
knitr::kable(ds_lu_gender, caption = "Gender Mapping")

ds_lu_race <- tibble::tribble(
  ~input , ~displayed                                   ,
  "1"    , "American Indian/Alaska Native"              ,
  "2"    , "Asian"                                      ,
  "3"    , "Native Hawaiian or Other Pacific Islander"  ,
  "4"    , "Black or African American"                  ,
  "5"    , "White"                                      ,
  "M"    , "More than One Race"                         ,
  "6"    , "Unknown or Not Reported"
)
knitr::kable(ds_lu_race, caption = "Race Mapping")

ds_lu_ethnicity <- tibble::tribble(
  ~input,   ~displayed                      ,
  "2"   ,  "Not Hispanic or Latino"         ,
  "1"   ,  "Hispanic or Latino"             ,
  "0"   ,  "Unknown/Not Reported Ethnicity"
)
knitr::kable(ds_lu_ethnicity, caption = "Ethnicity Mapping")

## ----local-apply-map-----------------------------------------------------
ds_summary_long <- codified::table_nih_enrollment(
  d              = ds,
  d_lu_gender    = ds_lu_gender,
  d_lu_race      = ds_lu_race,
  d_lu_ethnicity = ds_lu_ethnicity
)

knitr::kable(ds_summary_long, caption = "Counts of Each Subgroup")

## ----local-cosmetically-format-------------------------------------------
codified::table_nih_enrollment_pretty(
  d              = ds,
  d_lu_gender    = ds_lu_gender,
  d_lu_race      = ds_lu_race,
  d_lu_ethnicity = ds_lu_ethnicity
)

## ----install-redcapr-----------------------------------------------------
if( !requireNamespace("REDCapR", quietly=T) )
  devtools::install_github("OuhscBbmc/REDCapR")

library(REDCapR)

## ----redcap-establish----------------------------------------------------
if( !requireNamespace("REDCapR", quietly=TRUE) ) {
  ds <- ds_2 # If REDCapR isn't installed, use the previous version of the dataset.
} else if( "0.9.8" < packageVersion("REDCapR") ) {
  ds_2 <- REDCapR::redcap_read_oneshot(
    redcap_uri = "https://bbmc.ouhsc.edu/redcap/api/",  # URL of REDCap Server.
    token      = "F304DEC3793FECC3B6DEEFF66302CAD3",    # User-specific token/password.
    guess_type = FALSE                                  # Keep all variables as strings/characters.
  )$data  
} else {
  # Older versions of REDCapR don't have the `guess_type` parameter
  ds_2 <- REDCapR::redcap_read_oneshot(
    redcap_uri = "https://bbmc.ouhsc.edu/redcap/api/",  # URL of REDCap Server.
    token      = "F304DEC3793FECC3B6DEEFF66302CAD3"     # User-specific token/password.
  )$data %>% 
    dplyr::mutate(
      gender      = as.character(gender),
      race        = as.character(race),
      ethnicity   = as.character(ethnicity)
    )
}

## ----redcap-local-cosmetically-format------------------------------------
table_nih_enrollment_pretty(
  d               = ds_2,
  d_lu_gender     = ds_lu_gender,
  d_lu_race       = ds_lu_race,
  d_lu_ethnicity  = ds_lu_ethnicity
)

## ----collapsing-levels---------------------------------------------------
ds_lu_race_3 <- tibble::tribble(
  ~input                      , ~displayed                                  ,
  "American Indian"           , "American Indian/Alaska Native"             , # Combine w/ Alaska Native
  "Alaska Native"             , "American Indian/Alaska Native"             , # Combine w/ American Indian
  "Asian"                     , "Asian"                                     ,
  "Native Hawaiian"           , "Native Hawaiian or Other Pacific Islander" , # Combine w/ Pacific Islanders
  "Pacific Islander"          , "Native Hawaiian or Other Pacific Islander" , # Combine w/ Hawaiian
  "Black or African American" , "Black or African American"                 ,
  "White"                     , "White"                                     ,
  "More than One Race"        , "More than One Race"                        ,
  "Unknown or Not Reported"   , "Unknown or Not Reported"
)

ds_3 <- tibble::tribble(
  ~subject_id,   ~gender  , ~race            ,  ~ethnicity                 ,
           1L,   "Female" , "American Indian",  "Not Hispanic or Latino"   ,
           2L,   "Male"   , "American Indian",  "Not Hispanic or Latino"   ,
           3L,   "Male"   , "American Indian",  "Not Hispanic or Latino"   ,
           4L,   "Female" , "Alaska Native"  ,  "Not Hispanic or Latino"   ,
           5L,   "Male"   , "Alaska Native"  ,  "Not Hispanic or Latino"   ,
           6L,   "Male"   , "Alaska Native"  ,  "Not Hispanic or Latino"   ,
           7L,   "Male"   , "White"          ,  "Not Hispanic or Latino"   ,
           8L,   "Male"   , "White"          ,  "Not Hispanic or Latino"        
)

table_nih_enrollment_pretty(
  d               = ds_3,
  d_lu_race       = ds_lu_race_3
)

