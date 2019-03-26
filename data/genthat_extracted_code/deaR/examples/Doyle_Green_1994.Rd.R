library(deaR)


### Name: Doyle_Green_1994
### Title: Data: Doyle and Green (1994).
### Aliases: Doyle_Green_1994
### Keywords: datasets

### ** Examples

# Example.
data("Doyle_Green_1994")
data_example <- read_data(datadea = Doyle_Green_1994,
                         dmus = 1,
                         inputs = 6:7,
                         outputs = 2:5)
result <- cross_efficiency(data_example,
                           orientation = "io",
                           selfapp = TRUE)
result$Arbitrary$cross_eff
result$Arbitrary$e
# Aggressive using method II
result$M2_agg$cross_eff
# Aggressive using method III
result$M3_agg$cross_eff




