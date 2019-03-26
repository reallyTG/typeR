library(healthcareai)


### Name: plot.explore_df
### Title: Plot Counterfactual Predictions
### Aliases: plot.explore_df

### ** Examples

# First, we need a model
set.seed(4956)
m <- machine_learn(pima_diabetes, patient_id, outcome = pregnancies,
                   models = "rf", tune = FALSE)
# Then we can explore our model through counterfactual predictions
counterfactuals <- explore(m)

# By default only the two most important varying features are plotted. This
# example shows how counterfactual predictions can provide insight into how a
# model maps inputs (features) to the output (outcome). This plot shows that for
# this dataset, age is the most important predictor of the number of pregnancies
# a woman has had, and the predicted number of pregnancies rises basically
# linearly from approximately 20 to 40 and then levels off.
plot(counterfactuals)

# To see the effects of more features in the model, increase the value of
# `n_use`. You can also specify which of the varying features are mapped to the
# x-axis and the color scale, and you can customize a variety of plot attributes
plot(counterfactuals, n_use = 3, x_var = weight_class, color_var = age,
    font_size = 9, strip_font_size = 1, line_width = 2, line_alpha = .5,
    rotate_x = TRUE, nrows = 1)

# And you can further modify the plot like any other ggplot object
p <- plot(counterfactuals, n_use = 1, print = FALSE)
p +
  ylab("predicted number of pregnancies") +
  theme_classic() +
  theme(aspect.ratio = 1,
        panel.background = element_rect(fill = "slateblue"),
        plot.caption = element_text(face = "italic"))



