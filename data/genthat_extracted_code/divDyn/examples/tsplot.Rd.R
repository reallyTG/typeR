library(divDyn)


### Name: tsplot
### Title: Time series plotting using a custom time scale
### Aliases: tsplot

### ** Examples

data(stages) 
  tsplot(stages, boxes="sys", shading="series")

# only the Mesozoic, custom axes
  tsplot(stages, boxes="system", shading="stage", xlim=52:81, 
    plot.args=list(axes=FALSE, main="Mesozoic"))
  axis(1, at=seq(250, 75, -25), labels=seq(250, 75, -25))
  axis(2)

# only the Triassic, use the supplied abbreviations
  tsplot(stages, boxes="short", shading="stage", xlim=c(250,199), 
    ylab="variable", labels.args=list(cex=1.5, col="blue"), 
    boxes.args=list(col="gray95"))

 # colourful plot with two levels of hierarchy
   tsplot(stages, boxes=c("short", "system"), shading="series",
     boxes.col=c("col", "systemCol"), xlim=c(52:69))



