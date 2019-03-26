library(NormExpression)


### Name: plotCors
### Title: plotCors
### Aliases: plotCors
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (data, methods = c("None", "HG7", "ERCC", "TN", "TC",
    "CR", "NR", "DESeq", "UQ", "TMM", "TU"), legend.position = c(0.15,
    0.56))
{
    if (!is.data.frame(data))
        data <- data.frame(data)
    if (is.factor(data$Value))
        data$Value <- as.numeric(as.character(data$Value))
    data$Methods <- factor(data$Methods, levels = methods, labels = methods)
    change_colours(ggplot(data = data, aes(x = Value, y = ..count../sum(..count..))) +
        geom_freqpoly(aes(group = Methods, color = Methods),
            size = 3, bins = 50) + xlab("Spearman correlation") +
        ylab("Fraction of gene pairs") + theme_bw() + theme(panel.grid.minor = element_blank(),
        axis.title.x = element_text(size = 48), axis.title.y = element_text(size = 48),
        axis.text.x = element_text(size = 38), axis.text.y = element_text(size = 38),
        legend.text = element_text(size = 39), legend.title = element_text(size = 43),
        legend.position = legend.position, legend.background = element_blank(),
        legend.key = element_blank(), legend.key.height = unit(1.8,
            "cm"), plot.margin = unit(c(0.5, 1, 0.5, 0.5), "cm")) +
        scale_x_continuous(expand = c(0.01, 0.01), breaks = round(seq(-1,
            1, 0.25), 2)) + scale_y_continuous(expand = c(0.01,
        0)) + guides(color = guide_legend(title = NULL)), c("olivedrab",
        "blue", "red", "violet", "orange", "yellow", "magenta",
        "peru", "black", "maroon", "lightblue", "darkslateblue",
        "seashell4", "tan2", "darkgreen", "springgreen"))
  }



