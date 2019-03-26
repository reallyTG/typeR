library(rakeR)


### Name: weight
### Title: weight
### Aliases: weight

### ** Examples

# SimpleWorld
cons <- data.frame(
"zone"      = letters[1:3],
"age_0_49"  = c(8, 2, 7),
"age_gt_50" = c(4, 8, 4),
"sex_f"     = c(6, 6, 8),
"sex_m"     = c(6, 4, 3),
stringsAsFactors = FALSE
)
inds <- data.frame(
"id"     = LETTERS[1:5],
"age"    = c("age_gt_50", "age_gt_50", "age_0_49", "age_gt_50", "age_0_49"),
"sex"    = c("sex_m", "sex_m", "sex_m", "sex_f", "sex_f"),
"income" = c(2868, 2474, 2231, 3152, 2473),
stringsAsFactors = FALSE
)
# Set variables to constrain over
vars <- c("age", "sex")
weights <- weight(cons = cons, inds = inds, vars = vars)
print(weights)



