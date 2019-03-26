library(atlantistools)


### Name: plot_bar
### Title: Function to plot relative contribution of biomass and numbers
###   per cohort.
### Aliases: plot_bar

### ** Examples

plot_bar(preprocess$biomass)

# Most models have a large number of groups. Please make sure to combine groups with a low
# contribution prior to plotting with \code{combine_groups}.
df <- combine_groups(preprocess$biomass, group_col = "species", combine_thresh = 3)
plot_bar(df)

# This function can also be used to plot age-specific data.
plot_bar(preprocess$nums_age, fill = "agecl", wrap = "species")

# Please use \code{agg_perc} to visualize the relative cohort structure over time.
df <- agg_perc(preprocess$nums_age, groups = c("time", "species"))
plot_bar(df, fill = "agecl", wrap = "species")



