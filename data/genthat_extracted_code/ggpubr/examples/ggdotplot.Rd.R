library(ggpubr)


### Name: ggdotplot
### Title: Dot plot
### Aliases: ggdotplot

### ** Examples

# Load data
data("ToothGrowth")
df <- ToothGrowth

# Basic plot with summary statistics : mean_sd
# +++++++++++++++++++++++++++
ggdotplot(df, x = "dose", y = "len",
   add = "mean_sd")

# Change error.plot to "crossbar"
ggdotplot(df, x = "dose", y = "len",
 add = "mean_sd", add.params = list(width = 0.5),
 error.plot = "crossbar")


# Add box plot
ggdotplot(df, x = "dose", y = "len",
 add = "boxplot")

# Add violin + mean_sd
ggdotplot(df, x = "dose", y = "len",
 add = c("violin", "mean_sd"))


# Change colors
# +++++++++++++++++++++++++++
# Change fill and outline colors by groups: dose
# Use custom color palette
 ggdotplot(df, "dose", "len",
     add = "boxplot",
      color = "dose", fill = "dose",
      palette = c("#00AFBB", "#E7B800", "#FC4E07"))


# Plot with multiple groups
# +++++++++++++++++++++
# Change color by a second group : "supp"
ggdotplot(df, "dose", "len", fill = "supp", color = "supp",
    palette = c("#00AFBB", "#E7B800"))





