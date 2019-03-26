library(deaR)


### Name: Lim_Zhu_2015
### Title: Data: Lim and Zhu (2015).
### Aliases: Lim_Zhu_2015
### Keywords: datasets

### ** Examples

# Example. Arbitrary formulation.
# Input-oriented model under variable returns-to-scale.
data("Lim_Zhu_2015")
data_example <- read_data(Lim_Zhu_2015,
                          dmus=1,
                          ni=1,
                          no=5)
cross <- cross_efficiency(data_example,
                          epsilon = 0,
                          orientation = "io",
                          rts = "vrs",
                          selfapp = TRUE,
                          M2 = FALSE,
                          M3 = FALSE)
cross$Arbitrary$e




