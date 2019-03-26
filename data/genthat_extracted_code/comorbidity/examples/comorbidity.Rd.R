library(comorbidity)


### Name: comorbidity
### Title: Compute comorbidity scores.
### Aliases: comorbidity

### ** Examples

set.seed(1)
x <- data.frame(
  id = sample(1:15, size = 200, replace = TRUE),
  code = sample_diag(200),
  stringsAsFactors = FALSE)

# Charlson score based on ICD-10 diagnostic codes:
comorbidity(x = x, id = "id", code = "code", score = "charlson")

# Elixhauser score based on ICD-10 diagnostic codes:
comorbidity(x = x, id = "id", code = "code", score = "elixhauser")




