library(SubgrPlots)


### Name: plot_contour_localreg
### Title: Contour plot for effect size via local regression.
### Aliases: plot_contour_localreg

### ** Examples

## No test: 
library(dplyr)

# Load the data to be used
data(prca)
dat <- prca
dat %>%
  rename(Weight = weight,
         Age = age) -> dat

plot_contour_localreg(dat,
                      covari.sel = c(8,9),
                      trt.sel = 3,
                      resp.sel = c(1,2),
                      n.grid = c(100,100),
                      font.size = c(1, 1, 1, 1, 1),
                      brk.es = seq(-4.5,4.5,length.out = 101),
                      n.brk.axis =  7,
                      strip = "Treatment effect size (log hazard ratio)",
                      outcome.type = "survival")
## End(No test)



