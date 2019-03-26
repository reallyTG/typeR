library(confinterpret)


### Name: plot_interpretation_result_list
### Title: Plotting function for collection of interpretation_result
###   objects
### Aliases: plot_interpretation_result_list

### ** Examples


# Set up some intervals to test:
ci_stage_1 <- matrix(c(0.023, 0.131), nrow = 1,
                     dimnames = list("estimate", c("2.5 %", "97.5 %")))
ci_stage_2 <- matrix(c(-0.016, 0.096), nrow = 1,
                     dimnames = list("estimate", c("2.5 %", "97.5 %")))
# Conduct the interpretations:
interp_stage_1 <-  interpret_noninferiority(ci_stage_1, actual_null = 0,
                                           ni_margin = 0.05,
                                           groups = c("Business as usual",
                                                      "New approach"))
interp_stage_2 <-  interpret_noninferiority(ci_stage_2, actual_null = 0,
                                           ni_margin = 0.05,
                                           groups = c("Business as usual",
                                                      "New approach"))

# Assemble the list object:
interp_1_and_2 <- list("Stage 1" = interp_stage_1,
                       "Stage 2" = interp_stage_2)
# Set a nice colour scheme
grDevices::palette(c("#FF671F99", "#F2A90099", "#0085CA99"))
plot_interpretation_result_list(interp_1_and_2,
                                boundary_label_pos = "on top")




