library(sjlabelled)


### Name: get_term_labels
### Title: Retrieve labels of model terms from regression models
### Aliases: get_term_labels get_dv_labels

### ** Examples

# use data set with labelled data
data(efc)

fit <- lm(barthtot ~ c160age + c12hour + c161sex + c172code, data = efc)
get_term_labels(fit)

# make "education" categorical
library(sjmisc)
efc$c172code <- to_factor(efc$c172code)
fit <- lm(barthtot ~ c160age + c12hour + c161sex + c172code, data = efc)
get_term_labels(fit)

# prefix value of categorical variables with variable name
get_term_labels(fit, prefix = "varname")

# prefix value of categorical variables with value label
get_term_labels(fit, prefix = "label")

# get label of dv
get_dv_labels(fit)

# create "labelled" plot
library(ggplot2)
library(broom)
ggplot(tidy(fit)[-1, ], aes(x = term, y = estimate)) +
  geom_point() +
  coord_flip() +
  scale_x_discrete(labels = get_term_labels(fit))




