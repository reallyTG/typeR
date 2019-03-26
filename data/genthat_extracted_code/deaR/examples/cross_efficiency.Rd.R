library(deaR)


### Name: cross_efficiency
### Title: Cross efficiency tables
### Aliases: cross_efficiency

### ** Examples

# Example 1.
# Arbitrary formulation. Input-oriented model under constant returns-to-scale.
data("Golany_Roll_1989")
data_example <- read_data(datadea = Golany_Roll_1989, 
                          dmus = 1, 
                          inputs = 2:4, 
                          outputs = 5:6)
result <- cross_efficiency(data_example, 
                           orientation = "io", 
                           rts = "crs", 
                           selfapp = TRUE)
result$Arbitrary$cross_eff
result$Arbitrary$e

# Example 2.
# Benevolent formulation (method II). Input-oriented.
data("Golany_Roll_1989")
data_example <- read_data(datadea = Golany_Roll_1989, 
                          dmus = 1, 
                          inputs = 2:4, 
                          outputs = 5:6)
result <- cross_efficiency(data_example, 
                           orientation = "io", 
                           selfapp = TRUE)
result$M2_ben$cross_eff
result$M2_ben$e

# Example 3.
# Benevolent formulation (method III). Input-oriented.
data("Golany_Roll_1989")
data_example <- read_data(datadea = Golany_Roll_1989, 
                          dmus = 1, 
                          inputs = 2:4, 
                          outputs = 5:6)
result <- cross_efficiency(data_example, 
                           orientation = "io", 
                           selfapp = TRUE)
result$M3_ben$cross_eff
result$M3_ben$e
  
# Example 4.
# Arbitrary formulation. Output-oriented.
data("Golany_Roll_1989")
data_example <- read_data(datadea = Golany_Roll_1989,
                          dmus = 1, 
                          inputs = 2:4, 
                          outputs = 5:6)
result <- cross_efficiency(data_example, 
                           orientation = "oo", 
                           selfapp = TRUE)
result$Arbitrary$cross_eff
result$Arbitrary$e

# Example 5.
# Arbitrary formulation. Input-oriented model under vrs returns-to-scale.
data("Lim_Zhu_2015")
data_example <- read_data(Lim_Zhu_2015,
                          dmus = 1, 
                          ni = 1, 
                          no = 5)
cross <- cross_efficiency(data_example,
                          epsilon = 0,
                          orientation = "io",
                          rts = "vrs",
                          selfapp = TRUE,
                          M2 = FALSE,
                          M3 = FALSE)
cross$Arbitrary$e




