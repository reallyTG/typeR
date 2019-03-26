library(sjmisc)


### Name: to_value
### Title: Convert factors to numeric variables
### Aliases: to_value

### ** Examples

library(sjlabelled)
data(efc)
test <- as_label(efc$e42dep)
table(test)

table(to_value(test))
hist(to_value(test, start.at = 0))

# set lowest value of new variable to "5".
table(to_value(test, start.at = 5))

# numeric factor keeps values
dummy <- factor(c("3", "4", "6"))
table(to_value(dummy))

# do not drop unused factor levels
dummy <- ordered(c(rep("No", 5), rep("Maybe", 3)),
                 levels = c("Yes", "No", "Maybe"))
to_value(dummy)

# non-numeric factor is converted to numeric
# starting at 1
dummy <- factor(c("D", "F", "H"))
table(to_value(dummy))

library(sjlabelled)
# for numeric factor levels, value labels will be used, if present
dummy1 <- factor(c("3", "4", "6"))
dummy1 <- set_labels(dummy1, labels = c("first", "2nd", "3rd"))
dummy1
to_value(dummy1)

# for non-numeric factor levels, these will be used.
# value labels will be ignored
dummy2 <- factor(c("D", "F", "H"))
dummy2 <- set_labels(dummy2, labels = c("first", "2nd", "3rd"))
dummy2
to_value(dummy2)


# easily coerce specific variables in a data frame to numeric
# and keep other variables, with their class preserved
data(efc)
efc$e42dep <- as.factor(efc$e42dep)
efc$e16sex <- as.factor(efc$e16sex)
efc$e17age <- as.factor(efc$e17age)

# convert back "sex" and "age" into numeric
to_value(efc, e16sex, e17age)

x <- factor(c("None", "Little", "Some", "Lots"))
x <- set_labels(x, labels = c("0.5", "1.3", "1.8", ".2"))
x
to_value(x)
to_value(x, use.labels = TRUE)
to_value(x, use.labels = TRUE, keep.labels = FALSE)




