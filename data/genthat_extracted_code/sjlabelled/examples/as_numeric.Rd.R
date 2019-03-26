library(sjlabelled)


### Name: as_numeric
### Title: Convert factors to numeric variables
### Aliases: as_numeric

### ** Examples

data(efc)
test <- as_label(efc$e42dep)
table(test)

table(as_numeric(test))
hist(as_numeric(test, start.at = 0))

# set lowest value of new variable to "5".
table(as_numeric(test, start.at = 5))

# numeric factor keeps values
dummy <- factor(c("3", "4", "6"))
table(as_numeric(dummy))

# do not drop unused factor levels
dummy <- ordered(c(rep("No", 5), rep("Maybe", 3)),
                 levels = c("Yes", "No", "Maybe"))
as_numeric(dummy)

# non-numeric factor is converted to numeric
# starting at 1
dummy <- factor(c("D", "F", "H"))
table(as_numeric(dummy))

# for numeric factor levels, value labels will be used, if present
dummy1 <- factor(c("3", "4", "6"))
dummy1 <- set_labels(dummy1, labels = c("first", "2nd", "3rd"))
dummy1
as_numeric(dummy1)

# for non-numeric factor levels, these will be used.
# value labels will be ignored
dummy2 <- factor(c("D", "F", "H"))
dummy2 <- set_labels(dummy2, labels = c("first", "2nd", "3rd"))
dummy2
as_numeric(dummy2)


# easily coerce specific variables in a data frame to numeric
# and keep other variables, with their class preserved
data(efc)
efc$e42dep <- as.factor(efc$e42dep)
efc$e16sex <- as.factor(efc$e16sex)
efc$e17age <- as.factor(efc$e17age)

# convert back "sex" and "age" into numeric
as_numeric(efc, e16sex, e17age)

x <- factor(c("None", "Little", "Some", "Lots"))
x <- set_labels(x, labels = c("0.5", "1.3", "1.8", ".2"))
x
as_numeric(x)
as_numeric(x, use.labels = TRUE)
as_numeric(x, use.labels = TRUE, keep.labels = FALSE)




