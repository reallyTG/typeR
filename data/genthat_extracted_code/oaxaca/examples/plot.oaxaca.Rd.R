library(oaxaca)


### Name: plot.oaxaca
### Title: Coefficient Bar Plots for the Blinder-Oaxaca Decomposition
### Aliases: plot.oaxaca
### Keywords: models regression nonlinear robust multivariate

### ** Examples

# set random seed
set.seed(08544)

# load data set of Hispanic workers in Chicago
data("chicago")

# perform Blinder-Oaxaca Decomposition:
# explain differences in log real wages across native and foreign-born groups
oaxaca.results <- oaxaca(ln.real.wage ~ age + female + LTHS + some.college + 
                                          college + advanced.degree | foreign.born, 
                         data = chicago, R = 50)

# plot results of the threefold decomposition, variable-by-variable
# only include educational variables
# decomposition components along the left side of the plot
plot(oaxaca.results, component.left = TRUE,
     variables = c("LTHS", "some.college", "college", "advanced.degree"),
     variable.labels = c("LTHS" = "less than high school", 
                         "some.college" = "some college",
                         "advanced.degree" = "advanced degree"))
                         
# plot results of the twofold decomposition (overall results)
# equal weight for Group A and B in reference coefficient determinantion (weight = 0.5)
# unexplained portion split into A and B
plot(oaxaca.results, decomposition = "twofold", type = "overall",
     group.weight = 0.5, unexplained.split = TRUE, 
     bar.color = c("limegreen", "hotpink", "steelblue"))




