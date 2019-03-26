library(pltesim)


### Name: plte_plot
### Title: Plot objects created by plte_builder
### Aliases: plte_plot

### ** Examples

data('negative')

# BTSCS set the data
neg_set <- btscs(df = negative, event = 'y', t_var = 'tim',
                 cs_unit = 'group', pad_ts = FALSE)
                 # Create temporal dependence variables
neg_set$t <- neg_set$spell + 1

m1 <- glm(y ~ x + t + I(t^2) + I(t^3),
          family = binomial(link = 'logit'),
          data = neg_set)

counterfactual <- data.frame(x = 0.5)

sim1 <- plte_builder(obj = m1, obj_tvar = 't',
                     cf = counterfactual, t_points = c(13, 25),
                     cf_duration = 4, ci = 99)

# With time point labels
plte_plot(sim1)

# Without time point labels
plte_plot(sim1, t_labels = FALSE)





