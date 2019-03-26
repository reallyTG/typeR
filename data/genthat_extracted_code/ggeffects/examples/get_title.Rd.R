library(ggeffects)


### Name: get_title
### Title: Get titles and labels from data
### Aliases: get_title get_x_title get_y_title get_legend_title
###   get_legend_labels get_x_labels get_complete_df

### ** Examples

data(efc)
efc$c172code <- sjmisc::to_factor(efc$c172code)
fit <- lm(barthtot ~ c12hour + neg_c_7 + c161sex + c172code, data = efc)

mydf <- ggpredict(fit, terms = c("c12hour", "c161sex", "c172code"))

library(ggplot2)
ggplot(mydf, aes(x = x, y = predicted, colour = group)) +
  stat_smooth(method = "lm") +
  facet_wrap(~facet, ncol = 2) +
  labs(
    x = get_x_title(mydf),
    y = get_y_title(mydf),
    colour = get_legend_title(mydf)
  )

# get marginal effects, a list of data frames (one data frame per term)
eff <- ggeffect(fit)
eff
get_complete_df(eff)

# get marginal effects for education only, and get x-axis-labels
mydat <- eff[["c172code"]]
ggplot(mydat, aes(x = x, y = predicted, group = group)) +
  stat_summary(fun.y = sum, geom = "line") +
  scale_x_discrete(labels = get_x_labels(mydat))




