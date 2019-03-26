library(ggpubr)


### Name: ggboxplot
### Title: Box plot
### Aliases: ggboxplot

### ** Examples

# Load data
data("ToothGrowth")
df <- ToothGrowth

# Basic plot
# +++++++++++++++++++++++++++
# width: change box plots width
ggboxplot(df, x = "dose", y = "len", width = 0.8)

# Change orientation: horizontal
ggboxplot(df, "dose", "len", orientation = "horizontal")

# Notched box plot
ggboxplot(df, x = "dose", y = "len",
   notch = TRUE)

# Add dots
# ++++++++++++++++++++++++++
ggboxplot(df, x = "dose", y = "len",
   add = "dotplot")

# Add jitter points and change the shape by groups
ggboxplot(df, x = "dose", y = "len",
   add = "jitter", shape = "dose")


# Select and order items
# ++++++++++++++++++++++++++++++

# Select which items to display: "0.5" and "2"
ggboxplot(df, "dose", "len",
   select = c("0.5", "2"))

# Change the default order of items
ggboxplot(df, "dose", "len",
   order = c("2", "1", "0.5"))


# Change colors
# +++++++++++++++++++++++++++
# Change outline and fill colors
 ggboxplot(df, "dose", "len",
   color = "black", fill = "gray")

# Change outline colors by groups: dose
# Use custom color palette
# Add jitter points and change the shape by groups
 ggboxplot(df, "dose", "len",
    color = "dose", palette =c("#00AFBB", "#E7B800", "#FC4E07"),
    add = "jitter", shape = "dose")

# Change fill color by groups: dose
 ggboxplot(df, "dose", "len",
     fill = "dose", palette = c("#00AFBB", "#E7B800", "#FC4E07"))


# Box plot with multiple groups
# +++++++++++++++++++++
# fill or color box plot by a second group : "supp"
ggboxplot(df, "dose", "len", color = "supp",
 palette = c("#00AFBB", "#E7B800"))




