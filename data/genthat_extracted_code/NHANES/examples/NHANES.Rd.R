library(NHANES)


### Name: NHANES
### Title: NHANES 2009-2012 with adjusted weighting
### Aliases: NHANES NHANESraw

### ** Examples

# Due to the sampling design, some races were over/under-sampled.
rbind(
  NHANES = table(NHANES$Race1) / nrow(NHANES),
  NHANESraw = table(NHANESraw$Race1) / nrow(NHANESraw),
  diff = (table(NHANES$Race1) - table(NHANESraw$Race1)) / nrow(NHANESraw)
)
# SmokeNow is only asked of people who answer Yes to Smoke100
if (require(mosaic)) {
  nhanes <-
    NHANES %>%
    mutate(
      SmokingStatus = derivedFactor(
        Current = SmokeNow == "Yes",
        Former = SmokeNow == "No",
        Never  = Smoke100 == "No"
        )
      )
   tally( ~SmokingStatus, data = nhanes )
}



