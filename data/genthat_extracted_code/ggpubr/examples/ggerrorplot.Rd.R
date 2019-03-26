library(ggpubr)


### Name: ggerrorplot
### Title: Visualizing Error
### Aliases: ggerrorplot

### ** Examples


# Data: ToothGrowth data set we'll be used.
df<- ToothGrowth
head(df, 10)

# Plot mean_se
ggerrorplot(df, x = "dose", y = "len")


# Change desc_stat to mean_sd
# (other values include: mean_sd, mean_ci, median_iqr, ....)
# Add labels
ggerrorplot(df, x = "dose", y = "len",
 desc_stat = "mean_sd")

# Change error.plot to "errorbar" and add mean point
# Visualize the mean of each group
ggerrorplot(df, x = "dose", y = "len",
 add = "mean", error.plot = "errorbar")

# Horizontal plot
ggerrorplot(df, x = "dose", y = "len",
 add = "mean", error.plot = "errorbar",
 orientation = "horizontal")


# Change error.plot to "crossbar"
ggerrorplot(df, x = "dose", y = "len",
 error.plot = "crossbar", width = 0.5)


# Add jitter points and errors (mean_se)
ggerrorplot(df, x = "dose", y = "len",
 add = "jitter")

# Add dot and errors (mean_se)
ggerrorplot(df, x = "dose", y = "len",
 add = "dotplot")

# Multiple groups with error bars and jitter point
ggerrorplot(df, x = "dose", y = "len",
 color = "supp", palette = "Paired",
 error.plot = "pointrange",
 position = position_dodge(0.5))





