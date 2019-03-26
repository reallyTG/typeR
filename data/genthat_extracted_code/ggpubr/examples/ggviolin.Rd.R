library(ggpubr)


### Name: ggviolin
### Title: Violin plot
### Aliases: ggviolin

### ** Examples

# Load data
data("ToothGrowth")
df <- ToothGrowth

# Basic plot
# +++++++++++++++++++++++++++
ggviolin(df, x = "dose", y = "len")
# Change the plot orientation: horizontal
ggviolin(df, "dose", "len", orientation = "horiz")

# Add summary statistics
# ++++++++++++++++++++++++++
# Draw quantiles
ggviolin(df, "dose", "len", add = "none",
   draw_quantiles = 0.5)

# Add box plot
ggviolin(df, x = "dose", y = "len",
 add = "boxplot")

ggviolin(df, x = "dose", y = "len",
 add = "dotplot")

# Add jitter points and
# change point shape by groups ("dose")
ggviolin(df, x = "dose", y = "len",
add = "jitter", shape = "dose")


# Add mean_sd + jittered points
ggviolin(df, x = "dose", y = "len",
 add = c("jitter", "mean_sd"))

# Change error.plot to "crossbar"
ggviolin(df, x = "dose", y = "len",
 add = "mean_sd", error.plot = "crossbar")


# Change colors
# +++++++++++++++++++++++++++
# Change outline and fill colors
ggviolin(df, "dose", "len",
   color = "black", fill = "gray")

# Change outline colors by groups: dose
# Use custom color palette and add boxplot
ggviolin(df, "dose", "len",  color = "dose",
   palette = c("#00AFBB", "#E7B800", "#FC4E07"),
   add = "boxplot")

# Change fill color by groups: dose
# add boxplot with white fill color
ggviolin(df, "dose", "len", fill = "dose",
   palette = c("#00AFBB", "#E7B800", "#FC4E07"),
   add = "boxplot", add.params = list(fill = "white"))


# Plot with multiple groups
# +++++++++++++++++++++
# fill or color box plot by a second group : "supp"
ggviolin(df, "dose", "len", color = "supp",
 palette = c("#00AFBB", "#E7B800"), add = "boxplot")




