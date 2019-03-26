library(deaR)


### Name: Golany_Roll_1989
### Title: Data: Golany and Roll (1989).
### Aliases: Golany_Roll_1989
### Keywords: datasets

### ** Examples

# Example.
data("Golany_Roll_1989")
data_example <- read_data(datadea = Golany_Roll_1989,
                          dmus = 1,
                          inputs = 2:4,
                          outputs = 5:6)
result <- cross_efficiency(data_example,
                           orientation = "io",
                           selfapp = TRUE)
result$Arbitrary$cross_eff
result$Arbitrary$e




