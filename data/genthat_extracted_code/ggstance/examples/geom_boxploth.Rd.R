library(ggstance)


### Name: geom_boxploth
### Title: Horizontal box and whiskers plot.
### Aliases: geom_boxploth

### ** Examples

library("ggplot2")

# With ggplot2 we need coord_flip():
ggplot(mpg, aes(class, hwy, fill = factor(cyl))) +
  geom_boxplot() +
  coord_flip()

# With ggstance we use the h-suffixed version:
ggplot(mpg, aes(hwy, class, fill = factor(cyl))) +
  geom_boxploth()

# With facets ggstance horizontal layers are often the only way of
# having all ggplot features working correctly, for instance free
# scales:
df <- data.frame(
  Group = factor(rep(1:3, each = 4), labels = c("Drug A", "Drug B", "Control")),
  Subject = factor(rep(1:6, each = 2), labels = c("A", "B", "C", "D", "E", "F")),
  Result = rnorm(12)
)

ggplot(df, aes(Result, Subject))+
  geom_boxploth(aes(fill = Group))+
  facet_grid(Group ~ ., scales = "free_y")



