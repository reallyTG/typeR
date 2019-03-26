library(SubgrPlots)


### Name: plot_contour
### Title: Contour plot for subgroup effect size
### Aliases: plot_contour

### ** Examples

library(dplyr)

# Load the data to be used
data(prca)
dat <- prca
setup.ss =  c(10,60,15,30)
sub.title = bquote(N[11] %~~% .(setup.ss[2]) ~", "~
                     N[12] %~~% .(setup.ss[1]) ~", "~
                     N[21] %~~% .(setup.ss[4]) ~", "~
                     N[22] %~~% .(setup.ss[3]))
dat %>%
  rename(Weight = weight,
         Age = age) -> dat

plot_contour(dat,
             covari.sel = c(8,9),
             trt.sel = 3,
             resp.sel = c(1,2),
             outcome.type = "survival",
             setup.ss =  setup.ss,
             n.grid = c(100,100),
             brk.es = seq(-4.5,4.5,length.out = 101),
             n.brk.axis =  7,
             para.plot = c(0.5, 2, 6),
             font.size = c(1, 1, 1, 1, 1),
             title = NULL,
             subtitle = sub.title,
             strip = paste("Treatment effect size (log hazard ratio)"),
             show.overall = TRUE,show.points = TRUE,
             filled = TRUE, palette = "hcl",col.power = 0.75)




