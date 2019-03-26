library(marelac)


### Name: sw_svel
### Title: Velocity of the Sound in Seawater
### Aliases: sw_svel
### Keywords: utilities

### ** Examples

sw_svel(t = 40, S = 40, p = 10:20, method = "UNESCO")

# Check value UNESCO
sw_svel(t = 40, S = 40, p = 1000, method = "UNESCO")  # 1731.995
sw_svel(t = 0, S = 40, p = 0, method = "UNESCO")      # 1455.8

sw_svel(t = 40, S = 25, p = 1000, method = "UNESCO")  # 1719.2
sw_svel(t = 40, S = 25, p = 0, method = "UNESCO")     # 1553.4
sw_svel(t = 0, S = 25, p = 0, method = "UNESCO")      # 1435.8


# Check value Gibbs
sw_svel(S = 35.7, t = 25.5, p = 102.3)              # 1552.93372863425




