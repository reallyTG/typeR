library(ggpubr)


### Name: ggdotchart
### Title: Cleveland's Dot Plots
### Aliases: ggdotchart theme_cleveland

### ** Examples

# Load data
data("mtcars")
df <- mtcars
df$cyl <- as.factor(df$cyl)
df$name <- rownames(df)
head(df[, c("wt", "mpg", "cyl")], 3)

# Basic plot
ggdotchart(df, x = "name", y ="mpg",
  ggtheme = theme_bw())

# Change colors by  group cyl
ggdotchart(df, x = "name", y = "mpg",
   group = "cyl", color = "cyl",
   palette = c('#999999','#E69F00','#56B4E9'),
   rotate = TRUE,
   sorting = "descending",
   ggtheme = theme_bw(),
   y.text.col = TRUE )


# Plot with multiple groups
# +++++++++++++++++++++
# Create some data
df2 <- data.frame(supp=rep(c("VC", "OJ"), each=3),
                 dose=rep(c("D0.5", "D1", "D2"),2),
                 len=c(6.8, 15, 33, 4.2, 10, 29.5))
print(df2)

ggdotchart(df2, x = "dose", y = "len",
          color = "supp", size = 3,
          add = "segment",
          add.params = list(color = "lightgray", size = 1.5),
          position = position_dodge(0.3),
          palette = "jco",
          ggtheme = theme_pubclean()
)





