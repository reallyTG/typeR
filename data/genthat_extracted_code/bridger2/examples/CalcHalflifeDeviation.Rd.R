library(bridger2)


### Name: CalcHalflifeDeviation
### Title: Calculate RNA half-life SD.
### Aliases: CalcHalflifeDeviation

### ** Examples

group <- c("Control", "Knockdown")
hour <- c(0, 1, 2, 4, 8, 12)
half_sd_table <- CalcHalflifeDeviation(halflife_table,
                                       RNA_halflife_grubbs_test,
                                       group = c("CTRL_1",
                                                 "CTRL_2",
                                                 "CTRL_3"),
                                       save = FALSE)




