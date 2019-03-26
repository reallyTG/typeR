library(sjlabelled)


### Name: get_label
### Title: Retrieve variable label(s) of labelled data
### Aliases: get_label

### ** Examples

# import SPSS data set
# mydat <- read_spss("my_spss_data.sav", enc="UTF-8")

# retrieve variable labels
# mydat.var <- get_label(mydat)

# retrieve value labels
# mydat.val <- get_labels(mydat)

data(efc)

# get variable lable
get_label(efc$e42dep)

# alternative way
get_label(efc)["e42dep"]

# 'get_label()' also works within pipe-chains
efc %>% get_label(e42dep, e16sex)

# set default values
get_label(mtcars, mpg, cyl, def.value = "no var labels")

# simple barplot
barplot(table(efc$e42dep))
# get value labels to annotate barplot
barplot(table(efc$e42dep),
        names.arg = get_labels(efc$e42dep),
        main = get_label(efc$e42dep))

# get labels from multiple variables
get_label(list(efc$e42dep, efc$e16sex, efc$e15relat))

# use case conversion for human-readable labels
data(iris)
get_label(iris, def.value = colnames(iris))
get_label(iris, def.value = colnames(iris), case = "parsed")




