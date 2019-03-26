library(model4you)


### Name: lm_plot
### Title: Density plot for a given lm model with one binary covariate.
### Aliases: lm_plot

### ** Examples

## example taken from ?lm
ctl <- c(4.17,5.58,5.18,6.11,4.50,4.61,5.17,4.53,5.33,5.14)
trt <- c(4.81,4.17,4.41,3.59,5.87,3.83,6.03,4.89,4.32,4.69)
group <- gl(2, 10, 20, labels = c("Ctl","Trt"))
weight <- c(ctl, trt)
data <- data.frame(weight, group)
lm.D9 <- lm(weight ~ group, data = data)
lm_plot(lm.D9)

## example taken from ?glm (modified version)
data(anorexia, package = "MASS")
anorexia$treatment <- factor(anorexia$Treat != "Cont")
anorex.1 <- glm(Postwt ~ treatment + offset(Prewt),
                family = gaussian, data = anorexia)
lm_plot(anorex.1)




