library(weibulltools)


### Name: plot_mod_mix
### Title: Adding Estimated Population Lines of a Separated Mixture Model
###   to a Probability Plot
### Aliases: plot_mod_mix

### ** Examples

hours <- c(2, 28, 67, 119, 179, 236, 282, 317, 348, 387, 3, 31, 69, 135,
          191, 241, 284, 318, 348, 392, 5, 31, 76, 144, 203, 257, 286,
          320, 350, 412, 8, 52, 78, 157, 211, 261, 298, 327, 360, 446,
          13, 53, 104, 160, 221, 264, 303, 328, 369, 21, 64, 113, 168,
          226, 278, 314, 328, 377)
state <- c(1, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1,
          1, 0, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0,
          1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1,
          0, 1, 1, 1, 1, 1, 1)
john <- johnson_method(x = hours, event = state)

mix_mod <- mixmod_regression(x = john$characteristic,
                             y = john$prob,
                             event = john$status,
                             distribution = "weibull")

plot_weibull_mix <- plot_prob_mix(x = john$characteristic,
                                  y = john$prob,
                                  event = john$status,
                                  id = john$id,
                                  distribution = "weibull",
                                  reg_output = mix_mod,
                                  title_main = "Mixture Weibull Analysis",
                                  title_x = "Time in Hours",
                                  title_y = "Probability of Failure",
                                  title_trace = "classification")
plot_weibull_reg_mix <- plot_mod_mix(p_obj = plot_weibull_mix, x = hours,
                             reg_output = mix_mod,
                             distribution = "weibull",
                             title_trace = "model")



