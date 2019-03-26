library(atlantistools)


### Name: plot_line
### Title: Function to plot time series of atlantis ncdf output.
### Aliases: plot_line

### ** Examples

plot_line(preprocess$biomass)
plot_line(preprocess$biomass, col = "species")
plot_line(preprocess$biomass_age, col = "agecl")
plot_line(preprocess$biomass_age, wrap = "agecl", col = "species")

# The function can also be used to compare model outoput with observed data.
d <- system.file("extdata", "setas-model-new-becdev", package = "atlantistools")
ex_data <- read.csv(file.path(d, "setas-bench.csv"), stringsAsFactors = FALSE)
names(ex_data)[names(ex_data) == "biomass"] <- "atoutput"

data <- preprocess$biomass
data$model <- "atlantis"
comp <- rbind(ex_data, data, stringsAsFactors = FALSE)

# Show atlantis as first factor!
lev_ord <- c("atlantis", sort(unique(comp$model))[sort(unique(comp$model)) != "atlantis"])
comp$model <- factor(comp$model, levels = lev_ord)

# Create plot
plot_line(comp, col = "model")

## Not run: 
##D # Use \code{convert_relative_initial} and \code{plot_add_box}
##D # with \code{plot_line}. Use \code{convert_relative_initial} to
##D # generate a relative time series first.
##D df <- convert_relative_initial(preprocess$structn_age)
##D 
##D # Create the base plot with \code{plot_line}.
##D plot <- plot_line(df, col = "agecl")
##D 
##D # Add lower and upper range.
##D plot_add_box(plot)
##D 
##D # Create spatial timeseries plots in conjuction with \code{custom_grid}.
##D plot <- plot_line(preprocess$physics, wrap = NULL)
##D custom_grid(plot, grid_x = "polygon", grid_y = "variable")
##D 
##D plot <- plot_line(preprocess$flux, wrap = NULL, col = "variable")
##D custom_grid(plot, grid_x = "polygon", grid_y = "layer")
## End(Not run)



