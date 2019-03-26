## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

# load the library
library(phenocamr)


## ----eval = TRUE---------------------------------------------------------
sites <- list_sites()
print(head(sites))

## ----eval = TRUE---------------------------------------------------------
rois <- list_rois()
print(head(rois))

## ----eval = TRUE---------------------------------------------------------
  download_phenocam(site = "harvard$",
                    veg_type = "DB",
                    roi_id = "1000",
                    frequency = 3,
                    outlier_detection = FALSE,
                    smooth = FALSE,
                    out_dir = tempdir())

## ----eval = TRUE---------------------------------------------------------
df <- read_phenocam(file.path(tempdir(),"harvard_DB_1000_3day.csv"))

print(str(df))

## ----eval = TRUE---------------------------------------------------------
df <- expand_phenocam(df)

## ----eval = TRUE---------------------------------------------------------
  df <- detect_outliers(df)

## ----eval = TRUE---------------------------------------------------------
  df <- smooth_ts(df)

## ----eval = TRUE---------------------------------------------------------
start_of_season <- transition_dates(df)
print(head(start_of_season))

## ----eval = TRUE---------------------------------------------------------
phenology_dates <- phenophases(df, internal = TRUE)

## ----fig.width = 7, fig.height = 3---------------------------------------
plot(as.Date(df$data$date),
     df$data$smooth_gcc_90,
     type = "l",
     xlab = "date",
     ylab = "Gcc")

# rising "spring" greenup dates
abline(v = phenology_dates$rising$transition_50,
       col = "green")

# falling "autumn" senescence dates
abline(v = phenology_dates$falling$transition_50,
       col = "brown")


