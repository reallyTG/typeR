library(riskclustr)


### Name: eh_test_marker
### Title: Test for etiologic heterogeneity of risk factors according to
###   individual disease markers in a case-control study
### Aliases: eh_test_marker

### ** Examples


# Run for two binary tumor markers, which will combine to form four subtypes
eh_test_marker(
  markers = list("marker1", "marker2"),
  factors = list("x1", "x2", "x3"),
  case = "case",
  data = subtype_data,
  digits = 2
)



