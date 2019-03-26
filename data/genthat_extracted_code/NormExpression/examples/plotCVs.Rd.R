library(NormExpression)


### Name: plotCVs
### Title: plotCVs
### Aliases: plotCVs
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (data, methods = c("None", "HG7", "ERCC", "TN", "TC",
    "CR", "NR", "DESeq", "UQ", "TMM", "TU"), legend.position = c(0.85,
    0.48))
{
    if (!is.data.frame(data))
        data <- data.frame(data)
    if (is.factor(data$Cutoff))
        data$Cutoff <- as.numeric(as.character(data$Cutoff))
    if (is.factor(data$Counts))
        data$Counts <- as.numeric(as.character(data$Counts))
    data$Methods <- factor(data$Methods, levels = methods, labels = methods)
    change_colours(ggplot(data = data, aes(x = Cutoff, y = Counts)) +
        geom_line(aes(group = Methods, color = Methods), size = 3) +
        xlab("Normalized CV cutoff") + ylab("Number of uniform genes") +
        theme_bw() + theme(panel.grid.minor = element_blank(),
        axis.title.x = element_text(size = 48), axis.title.y = element_text(size = 48),
        axis.text.x = element_text(size = 38), axis.text.y = element_text(size = 38),
        legend.text = element_text(size = 39), legend.title = element_text(size = 43),
        legend.position = legend.position, legend.background = element_blank(),
        legend.key = element_blank(), legend.key.height = unit(1.8,
            "cm"), plot.margin = unit(c(0.5, 0.5, 0.5, 0.5),
            "cm")) + scale_x_continuous(breaks = seq(0, 1, 0.2)) +
        scale_y_continuous() + guides(color = guide_legend(title = NULL)),
        c("olivedrab", "blue", "red", "violet", "orange", "yellow",
            "magenta", "peru", "black", "maroon", "lightblue",
            "darkslateblue", "seashell4", "tan2", "darkgreen",
            "springgreen"))
  }



