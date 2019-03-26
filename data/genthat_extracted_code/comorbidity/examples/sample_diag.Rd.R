library(comorbidity)


### Name: sample_diag
### Title: Simulate ICD-10 and ICD-9 diagnostic codes
### Aliases: sample_diag

### ** Examples

# Simulate 10 ICD-10 codes
sample_diag(10)

# Simulate a tidy dataset with 15 individuals and 200 rows
set.seed(1)
x <- data.frame(
  id = sample(1:15, size = 200, replace = TRUE),
  code = sample_diag(n = 200),
  stringsAsFactors = FALSE)
head(x)




