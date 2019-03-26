library(rakeR)


### Name: check_constraint
### Title: check_constraint
### Aliases: check_constraint

### ** Examples

cons <- data.frame(
"zone"      = letters[1:3],
"age_0_49"  = c(8, 2, 7),
"age_gt_50" = c(4, 8, 4),
"sex_f"     = c(6, 6, 8),
"sex_m"     = c(6, 4, 3)
)
check_constraint(cons, 3)  # no errors



