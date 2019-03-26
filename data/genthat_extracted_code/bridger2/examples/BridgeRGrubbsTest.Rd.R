library(bridger2)


### Name: BridgeRGrubbsTest
### Title: RNA half-life Grubbs test.
### Aliases: BridgeRGrubbsTest

### ** Examples

group <- c("Control", "Knockdown")
hour <- c(0, 1, 2, 4, 8, 12)
half_sd_table <- CalcHalflifeDeviation(halflife_table,
                                       RNA_halflife_grubbs_test,
                                       group = c("CTRL_1",
                                                 "CTRL_2",
                                                 "CTRL_3"),
                                       save = FALSE)
grubbs_table <- BridgeRGrubbsTest(half_sd_table,
                                  halflife_table,
                                  compIndex = 4,
                                  controlGroup = c("CTRL_1",
                                                   "CTRL_2",
                                                   "CTRL_3"),
                                  save = FALSE)




