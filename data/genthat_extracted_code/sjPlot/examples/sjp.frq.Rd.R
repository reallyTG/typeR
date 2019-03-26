library(sjPlot)


### Name: sjp.frq
### Title: Plot frequencies of variables
### Aliases: sjp.frq

### ** Examples

library(sjlabelled)
data(efc)

# boxplot
sjp.frq(efc$e17age, type = "box")

# histogram
sjp.frq(efc$e17age, type = "hist", show.mean = TRUE)

# violin plot
sjp.frq(efc$e17age, type = "v")

# bar plot
sjp.frq(efc$e42dep)

library(sjmisc)
# grouped variable
ageGrp <- group_var(efc$e17age)
ageGrpLab <- group_labels(efc$e17age)
sjp.frq(ageGrp, title = get_label(efc$e17age), axis.labels = ageGrpLab)

# plotting confidence intervals. expand grid and v/hjust for text labels
sjp.frq(
  efc$e15relat, type = "dot", show.ci = TRUE, sort.frq = "desc",
  coord.flip = TRUE, expand.grid = TRUE, vjust = "bottom", hjust = "left"
)

# Simulate ggplot-default histogram
sjp.frq(efc$c160age, type = "h", geom.size = 3)

# histogram with overlayed normal curve
sjp.frq(efc$c160age, type = "h", show.mean = TRUE, show.mean.val = TRUE,
        normal.curve = TRUE, show.sd = TRUE, normal.curve.color = "blue",
        normal.curve.size = 3, ylim = c(0,50))




