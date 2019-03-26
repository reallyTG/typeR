library(ruler)


### Name: rules
### Title: Create a list of rules
### Aliases: rules

### ** Examples

rules_1 <- rules(mean, sd, .args = list(na.rm = TRUE))
rules_1_ref <- dplyr::funs('._.rule..1' = mean, '._.rule..2' = sd,
                           .args = list(na.rm = TRUE))
identical(rules_1, rules_1_ref)

rules_2 <- rules(mean, sd = sd, "var")
rules_2_ref <- dplyr::funs(
  '._.rule..1' = mean,
  '._.sd' = sd,
  '._.rule..3' = "var"
)
identical(rules_2, rules_2_ref)

rules_3 <- rules(mean, .prefix = "__")
rules_3_ref <- dplyr::funs('__rule..1' = mean)
identical(rules_3, rules_3_ref)




