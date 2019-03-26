library(SubgrPlots)


### Name: plot_stepp
### Title: STEPP for subgroup effect size
### Aliases: plot_stepp

### ** Examples

# Load the data to be used
data(prca)
dat <- prca

## 9. stepp Plot -----------------------------------------------------------
lab.y.title = paste("Treatment effect size (log-hazard ratio)");
setup.ss = c(30,40)
sub.title = paste0("(Subgroup sample sizes are set to ", setup.ss[2],
                   "; overlap sizes are set to ", setup.ss[1], ")" )
plot_stepp(dat,
           covari.sel = 8,
           trt.sel = 3,
           resp.sel = c(1, 2),
           outcome.type = "survival",
           setup.ss = c(30,40),
           alpha = 0.05,
           font.size = c(0.9, 1, 1, 1),
           title = NULL,
           lab.y = lab.y.title,
           subtitle = sub.title)





