library(PAutilities)


### Name: ba_plot
### Title: Create a Bland-Altman plot
### Aliases: ba_plot

### ** Examples

data(ex_data, package = "PAutilities")

# Reduce the number of data points (for illustration purposes) by isolating
# the 150 largest cases

illustration_threshold <-
    quantile(ex_data$Axis1, probs = 1 - (150 / nrow(ex_data)))
ex_data <- ex_data[ex_data$Axis1 > illustration_threshold, ]

# Generate the plot
my_ba <- ba_plot(
    ex_data,
    "(Axis1 + Axis3) / 2",
    "Axis1 - Axis3",
    "mean(Axis1, Axis3)",
    "Axis1 - Axis3"
)

my_ba

## No test: 
# You can add to the plot as you would a normal ggplot object
    my_ba +
      ggplot2::geom_text(
      x = 2000, y = 9000, label = "A",
      size = 8, fontface = "bold", colour = "blue"
      )

# With caution, you can change some automatic options (e.g. color of
# regression line) by overwriting in a new layer

    my_ba + ggplot2::geom_smooth(method = "lm", se = FALSE, colour = "blue")

## End(No test)



