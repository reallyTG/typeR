library(forestmangr)


### Name: plot_summarise
### Title: Summarize forest inventory data
### Aliases: plot_summarise

### ** Examples

library(forestmangr)
data("exfm21")
exfm21

# Obligatory arguments. Basic informations about the plot.
plot_summarise(exfm21, "PLOT", 810)

# Area values can be numeric, or a variable name
plot_summarise(exfm21, "PLOT", "PLOT_AREA")

# With DBH supplied, we get the mean diameter, quadratic diameter,
# basal area and basal area per hectare:
plot_summarise(exfm21, "PLOT", "PLOT_AREA", "DBH")

# With TH supplied, we get the mean total height and dominant height
plot_summarise(exfm21, "PLOT", "PLOT_AREA", "DBH", "TH_EST")

# With strata supplied, we divide the data into 2 strata
plot_summarise(exfm21, "PLOT", "PLOT_AREA", "DBH", "TH_EST", "STRATA")

# The strata area can also be supplied
plot_summarise(exfm21, "PLOT", "PLOT_AREA", "DBH", "TH_EST", "STRATA", "STRATA_AREA")

# With VWB supplied, we get the total vwb, and vwb per hectare
plot_summarise(exfm21, "PLOT", "PLOT_AREA", "DBH", "TH_EST", "STRATA", "STRATA_AREA",
 "VWB")

# With VWOB supplied, we get the total vwob, and vwob per hectare
plot_summarise(exfm21, "PLOT", "PLOT_AREA", "DBH", "TH_EST", "STRATA", "STRATA_AREA",
 "VWB", "VWOB")

# If the data already has a dominant height variable, it can also be supplied here
plot_summarise(exfm21, "PLOT", "PLOT_AREA", "DBH", "TH_EST", "STRATA", "STRATA_AREA",
 "VWB", "VWOB", "DH")

# With the AGE variable supplied, we get the average age of each plot
plot_summarise(exfm21, "PLOT", "PLOT_AREA", "DBH", "TH_EST", "STRATA", "STRATA_AREA",
 "VWB", "VWOB", "DH", "AGE")




