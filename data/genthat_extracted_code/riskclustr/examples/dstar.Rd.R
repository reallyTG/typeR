library(riskclustr)


### Name: dstar
### Title: Estimate the incremental explained risk variation in a case-only
###   study
### Aliases: dstar

### ** Examples


# Exclude controls from data as this is a case-only calculation
dstar(
  label = "subtype",
  M = 4,
  factors = list("x1", "x2", "x3"),
  data = subtype_data[subtype_data$subtype > 0, ]
)



