library(ggpubr)


### Name: annotate_figure
### Title: Annotate Arranged Figure
### Aliases: annotate_figure

### ** Examples

data("ToothGrowth")
df <- ToothGrowth
df$dose <- as.factor(df$dose)

# Create some plots
# ::::::::::::::::::::::::::::::::::::::::::::::::::
# Box plot
bxp <- ggboxplot(df, x = "dose", y = "len",
    color = "dose", palette = "jco")
# Dot plot
dp <- ggdotplot(df, x = "dose", y = "len",
    color = "dose", palette = "jco")
# Density plot
dens <- ggdensity(df, x = "len", fill = "dose", palette = "jco")

# Arrange and annotate
# ::::::::::::::::::::::::::::::::::::::::::::::::::
figure <- ggarrange(bxp, dp, dens, ncol = 2, nrow = 2)
annotate_figure(figure,
               top = text_grob("Visualizing Tooth Growth", color = "red", face = "bold", size = 14),
               bottom = text_grob("Data source: \n ToothGrowth data set", color = "blue",
                                  hjust = 1, x = 1, face = "italic", size = 10),
               left = text_grob("Figure arranged using ggpubr", color = "green", rot = 90),
               right = "I'm done, thanks :-)!",
               fig.lab = "Figure 1", fig.lab.face = "bold"
)





