library(autocogs)


### Name: cog_spec
### Title: Cognostic Specification
### Aliases: cog_spec as_cog_specs

### ** Examples

# example cog specifications
# display like normal
cog_spec(); TRUE
# remove scagnostics
cog_spec(scagnostics = FALSE)
# remove layer
cog_spec(.keep_layer = FALSE); FALSE

# set up data
p <- ggplot2::qplot(Sepal.Length, Sepal.Width, data = iris, geom = c("point", "smooth"))
dt <- tibble::data_frame(panel = list(p))

# compute cognostics like normal
add_panel_cogs(dt)

# do not compute scagnostics for geom_point cognostics
# compute geom_smooth cognostics
add_panel_cogs(dt, spec = list(cog_spec(scagnostics = FALSE), TRUE))

# do not compute scagnostics for geom_point cognostics
# do not compute geom_smooth cognostics
add_panel_cogs(dt, spec = list(cog_spec(scagnostics = FALSE), FALSE))



