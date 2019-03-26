library(sjlabelled)


### Name: get_labels
### Title: Retrieve value labels of labelled data
### Aliases: get_labels

### ** Examples

# import SPSS data set
# mydat <- read_spss("my_spss_data.sav")

# retrieve variable labels
# mydat.var <- get_label(mydat)

# retrieve value labels
# mydat.val <- get_labels(mydat)

data(efc)
get_labels(efc$e42dep)

# simple barplot
barplot(table(efc$e42dep))
# get value labels to annotate barplot
barplot(table(efc$e42dep),
        names.arg = get_labels(efc$e42dep),
        main = get_label(efc$e42dep))

# include associated values
get_labels(efc$e42dep, values = "as.name")

# include associated values
get_labels(efc$e42dep, values = "as.prefix")

# get labels from multiple variables
get_labels(list(efc$e42dep, efc$e16sex, efc$e15relat))


# create a dummy factor
f1 <- factor(c("hi", "low", "mid"))
# search for label attributes only
get_labels(f1, attr.only = TRUE)
# search for factor levels as well
get_labels(f1)

# same for character vectors
c1 <- c("higher", "lower", "mid")
# search for label attributes only
get_labels(c1, attr.only = TRUE)
# search for string values as well
get_labels(c1)


# create vector
x <- c(1, 2, 3, 2, 4, NA)
# add less labels than values
x <- set_labels(x, labels = c("yes", "maybe", "no"), force.values = FALSE)
# get labels for labelled values only
get_labels(x)
# get labels for all values
get_labels(x, non.labelled = TRUE)


# get labels, including tagged NA values
library(haven)
x <- labelled(c(1:3, tagged_na("a", "c", "z"), 4:1),
              c("Agreement" = 1, "Disagreement" = 4, "First" = tagged_na("c"),
                "Refused" = tagged_na("a"), "Not home" = tagged_na("z")))
# get current NA values
x
get_labels(x, values = "n", drop.na = FALSE)


# create vector with unused labels
data(efc)
efc$e42dep <- set_labels(
  efc$e42dep,
  labels = c("independent" = 1, "dependent" = 4, "not used" = 5)
)
get_labels(efc$e42dep)
get_labels(efc$e42dep, drop.unused = TRUE)
get_labels(efc$e42dep, non.labelled = TRUE, drop.unused = TRUE)




