library(DirichletReg)


### Name: plot.DirichletRegData
### Title: Plot Dirichlet-Distributed Data
### Aliases: plot.DirichletRegData lines.DirichletRegData
### Keywords: hplot

### ** Examples

# plot of "Sand" in the Arctic Lake data set
plot(DR_data(ReadingSkills[, 1]), main="Reading Accuracy")

# ternary plot of Arctic Lake data
plot(DR_data(ArcticLake[, 1:3]), a2d = list(colored = FALSE))



