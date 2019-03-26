library(marelac)


### Name: sw_cp
### Title: Heat Capacity of Sea Water
### Aliases: sw_cp
### Keywords: utilities

### ** Examples

sw_cp(S = 40, t = 40, p = 1000, method="UNESCO")  # 3849.5

# Check value Gibbs function
sw_cp(35.7,25.5,102.3)#3974.42541259729

# Check values UNESCO
sw_cp(S = 25, t = 10, p = 0,    method = "UNESCO")  # 4041.8
sw_cp(S = 25, t = 10, p = 1000, method = "UNESCO")  # 3842.3
sw_cp(S = 25, t = 30, p = 0,    method = "UNESCO")  # 4049.1

sw_cp(S = 40, t = 10, p = 0, method = "UNESCO")  # 3959.3




