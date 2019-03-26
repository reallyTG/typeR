library(amt)


### Name: hr_area
### Title: Home ranges
### Aliases: hr_area hr hr_isopleths hr_kde hr_kde.track_xy hr_kde_ref
###   hr_kde_ref.track_xy hr_locoh_k hr_locoh_k.track_xy hr_mcp
###   hr_mcp.track_xy

### ** Examples

data(deer)


# MCP ---------------------------------------------------------------------
mcp1 <- hr_mcp(deer)
hr_area(mcp1)

# calculated MCP at different levels
mcp1 <- hr_mcp(deer, levels = seq(0.3, 1, 0.1))
hr_area(mcp1)

# CRS are inherited
get_crs(deer)
mcps <- hr_mcp(deer, levels = c(0.5, 0.95, 1))
has_crs(mcps)

# Local Convex Hull (LoCoH) -----------------------------------------------
locoh1 <- hr_locoh_k(deer)
hr_area(locoh1)

# calculated MCP at different levels
locoh <- hr_locoh_k(deer, levels = seq(0.3, 1, 0.1))
hr_area(locoh)

# CRS are inherited
get_crs(deer)
get_crs(locoh1)

# Kernel density estimaiton (KDE) -----------------------------------------
kde1 <- hr_kde(deer)
hr_area(kde1)
get_crs(kde1)



