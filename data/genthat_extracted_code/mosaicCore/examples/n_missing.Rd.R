library(mosaicCore)


### Name: n_missing
### Title: Counting missing/non-missing elements
### Aliases: n_missing n_not_missing n_total

### ** Examples

if (require(NHANES) && require(mosaic)) {
  tally( ~ is.na(Height) + is.na(Weight), data = NHANES, margins = TRUE)
  NHANES %>%
    summarise(
      mean.wt = mean(Weight, na.rm = TRUE),
      missing.Wt = n_missing(Weight),
      missing.WtAndHt = n_missing(Weight, Height, type = "all"),
      missing.WtOrHt = n_missing(Weight, Height, type = "any")
      )
    }



