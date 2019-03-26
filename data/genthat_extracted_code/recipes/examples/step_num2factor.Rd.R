library(recipes)


### Name: step_num2factor
### Title: Convert Numbers to Factors
### Aliases: step_num2factor tidy.step_num2factor
### Keywords: datagen

### ** Examples

iris2 <- iris
iris2$Species <- as.numeric(iris2$Species)

rec <- recipe(~ ., data = iris2)

make_factor <- rec %>% step_num2factor(Species)
make_factor <- prep(make_factor,
                    training = iris2,
                    retain = TRUE)

# note that `diet` is a factor
juice(make_factor) %>% head
okc %>% head
tidy(make_factor, number = 1)

# When novel values are exposed
with_transform <- rec %>%
  step_num2factor(Species, transform = function(x) paste0("val_", x))

with_transform <- prep(with_transform,
                       training = iris2[1:75,])
new_values <- bake(with_transform, new_data = iris2, Species)
table(new_values[["Species"]], iris2$Species, useNA = "ifany")



