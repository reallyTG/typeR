library(forestmangr)


### Name: fit_clutter
### Title: Fit the Clutter model for growth and yield
### Aliases: fit_clutter
### Keywords: 2SLS Clutter,

### ** Examples


library(forestmangr)
data("exfm17")
exfm17

# To fit the Clutter model we just need to define the data, and age, dominant height,
# basal area, volume, site and plot variables:
fit_clutter(exfm17, "age", "DH", "B", "V", "S", "plot")

# To fit the alternate model (without a1) just use model="mod":
fit_clutter(exfm17, "age", "DH", "B", "V", "S", "plot",model="mod")

# To keep the regression model, use keep_model=TRUE:
fit_clutter(exfm17, "age", "DH", "B", "V", "S", "plot", keep_model=TRUE) 
             



