library(ggQC)


### Name: stat_pareto
### Title: Generate a Pareto Plot with ggplot
### Aliases: stat_pareto

### ** Examples

############################
#  Example 1: Pareto Plot  #
############################

# Load Libraries ----------------------------------------------------------
 require(ggQC)
 require(ggplot2)

# Setup Data --------------------------------------------------------------
 df <- data.frame(
                  x = letters[1:10],
                  y = as.integer(runif(n = 10, min = 0, max=100))
                 )

# Render Pareto Plot ------------------------------------------------------


ggplot(df, aes(x=x, y=y)) +
 stat_pareto(point.color = "red",
             point.size = 3,
             line.color = "black",
             #size.line = 1,
             bars.fill = c("blue", "orange"),
 )



