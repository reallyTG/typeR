library(forcats)


### Name: fct_reorder
### Title: Reorder factor levels by sorting along another variable
### Aliases: fct_reorder fct_reorder2 last2

### ** Examples

boxplot(Sepal.Width ~ Species, data = iris)
boxplot(Sepal.Width ~ fct_reorder(Species, Sepal.Width), data = iris)
boxplot(Sepal.Width ~ fct_reorder(Species, Sepal.Width, .desc = TRUE), data = iris)

chks <- subset(ChickWeight, as.integer(Chick) < 10)
chks <- transform(chks, Chick = fct_shuffle(Chick))

if (require("ggplot2")) {
ggplot(chks, aes(Time, weight, colour = Chick)) +
  geom_point() +
  geom_line()

# Note that lines match order in legend
ggplot(chks, aes(Time, weight, colour = fct_reorder2(Chick, Time, weight))) +
  geom_point() +
  geom_line() +
  labs(colour = "Chick")
}



