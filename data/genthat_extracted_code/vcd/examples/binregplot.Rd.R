library(vcd)


### Name: binreg_plot
### Title: Binary Regression Plot
### Aliases: binreg_plot grid_abline
### Keywords: category hplot

### ** Examples

## Simple model with no conditioning variables
art.mod0 <- glm(Improved > "None" ~ Age, data = Arthritis, family = binomial)

binreg_plot(art.mod0, "Arthritis Data")
binreg_plot(art.mod0, type = "link") ## logit scale

## one conditioning factor
art.mod1 <- update(art.mod0, . ~ . + Sex)
binreg_plot(art.mod1)
binreg_plot(art.mod1, legend = FALSE, labels = TRUE, xlim = c(20, 80))

## two conditioning factors
art.mod2 <- update(art.mod1, . ~ . + Treatment)
binreg_plot(art.mod2)
binreg_plot(art.mod2, subset = Sex == "Male") ## subsetting

## some tweaking
binreg_plot(art.mod2, gp_legend_frame = gpar(col = NA, fill = "white"), col_bands = NA)
binreg_plot(art.mod2, legend = FALSE, labels = TRUE,
            labels_pos = "left", labels_just = c("left", "top"))

## model with grouped response data
shuttle.mod <- glm(cbind(nFailures, 6 - nFailures) ~ Temperature,
                   data = SpaceShuttle, na.action = na.exclude, family = binomial)
binreg_plot(shuttle.mod, xlim = c(30, 81), pred_range = "xlim",
            ylab = "O-Ring Failure Probability", xlab = "Temperature (F)")



