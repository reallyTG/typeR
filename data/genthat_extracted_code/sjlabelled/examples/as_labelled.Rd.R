library(sjlabelled)


### Name: as_labelled
### Title: Convert vector to labelled class
### Aliases: as_labelled

### ** Examples

data(efc)
str(efc$e42dep)

x <- as_labelled(efc$e42dep)
str(x)

x <- as_labelled(efc$e42dep, add.class = TRUE)
str(x)

a <- c(1, 2, 4)
x <- as_labelled(a, add.class = TRUE)
str(x)

data(efc)
x <- set_labels(efc$e42dep,
                labels = c(`1` = "independent", `4` = "severe dependency"))
x1 <- as_labelled(x, add.labels = FALSE)
x2 <- as_labelled(x, add.labels = TRUE)

str(x1)
str(x2)

get_values(x1)
get_values(x2)




