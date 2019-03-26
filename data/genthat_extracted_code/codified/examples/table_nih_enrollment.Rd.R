library(codified)


### Name: table_nih_enrollment
### Title: Produce an NIH-compliant enrollment table.
### Aliases: table_nih_enrollment table_nih_enrollment_pretty

### ** Examples

library(magrittr)
ds_1 <- tibble::tribble(
  ~subject_id,   ~gender  , ~race                      ,   ~ethnicity                     ,
           1L,   "Male"   , "Black or African American",  "Not Hispanic or Latino"        ,
           2L,   "Male"   , "Black or African American",  "Not Hispanic or Latino"        ,
           3L,   "Female" , "Black or African American",  "Unknown/Not Reported Ethnicity",
           4L,   "Male"   , "White"                    ,  "Not Hispanic or Latino"        ,
           5L,   "Male"   , "White"                    ,  "Not Hispanic or Latino"        ,
           6L,   "Female" , "White"                    ,  "Not Hispanic or Latino"        ,
           7L,   "Male"   , "White"                    ,  "Hispanic or Latino"            ,
           8L,   "Male"   , "White"                    ,  "Hispanic or Latino"
)

table_nih_enrollment(ds_1)
table_nih_enrollment_pretty(ds_1)

table_nih_enrollment(ds_1) %>%
  tidyr::spread(key=gender, value=n)

table_nih_enrollment(ds_1) %>%
  dplyr::mutate(
    gender_ethnicity = paste0(gender, " by ", ethnicity)
  ) %>%
  dplyr::select(-gender, -ethnicity) %>%
  tidyr::spread(key=gender_ethnicity, value=n)

ds_2 <- tibble::tribble(
  ~subject_id,  ~gender , ~race                      , ~ethnicity    ,
           1L,  "Male"  , "Black or African American", "Not Latino"  ,
           2L,  "Male"  , "Black or African American", "Not Latino"  ,
           3L,  "Female", "Black or African American", "Unknown"     ,
           4L,  "Male"  , "White"                    , "Not Latino"  ,
           5L,  "Male"  , "White"                    , "Not Latino"  ,
           6L,  "Female", "White"                    , "Not Latino"  ,
           7L,  "Male"  , "White"                    , "Latino"      ,
           8L,  "Male"  , "White"                    , "Latino"
)

ds_lu_ethnicity <- tibble::tribble(
  ~input      ,   ~displayed                      ,
  "Not Latino",  "Not Hispanic or Latino"         ,
  "Latino"    ,  "Hispanic or Latino"             ,
  "Unknown"   ,  "Unknown/Not Reported Ethnicity"
)
table_nih_enrollment(ds_2, d_lu_ethnicity=ds_lu_ethnicity)
table_nih_enrollment_pretty(ds_2, d_lu_ethnicity=ds_lu_ethnicity)

## Read a 500-patient fake dataset
path <- system.file("misc/example-data-1.csv", package="codified")
ds_3 <- readr::read_csv(path) %>%
  dplyr::mutate(
    gender     = as.character(gender),
    race       = as.character(race),
    ethnicity  = as.character(ethnicity)
  )

ds_lu_gender <- tibble::tribble(
  ~input,   ~displayed                      ,
  "0"   ,  "Female",
  "1"   ,  "Male",
  "U"   ,  "Unknown/Not Reported"
)
ds_lu_race <- tibble::tribble(
  ~input ,   ~displayed                      ,
  "1"    , "American Indian/Alaska Native",
  "2"    , "Asian",
  "3"    , "Native Hawaiian or Other Pacific Islander",
  "4"    , "Black or African American",
  "5"    , "White",
  "M"    , "More than One Race",
  "6"    , "Unknown or Not Reported"
)
ds_lu_ethnicity <- tibble::tribble(
  ~input,   ~displayed                      ,
  "2"   ,  "Not Hispanic or Latino"         ,
  "1"   ,  "Hispanic or Latino"             ,
  "0"   ,  "Unknown/Not Reported Ethnicity"
)

table_nih_enrollment(
  d              = ds_3,
  d_lu_gender    = ds_lu_gender,
  d_lu_race      = ds_lu_race,
  d_lu_ethnicity = ds_lu_ethnicity
)

table_nih_enrollment_pretty(
  d              = ds_3,
  d_lu_gender    = ds_lu_gender,
  d_lu_race      = ds_lu_race,
  d_lu_ethnicity = ds_lu_ethnicity
)



