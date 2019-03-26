library(gsloid)


### Name: lisiecki2005
### Title: LR04 Global Pliocene-Pleistocene Benthic d18O Stack (5.3-Myr).
### Aliases: lisiecki2005
### Keywords: datasets

### ** Examples

names(lisiecki2005)
head(lisiecki2005)
# plot for 0-250 ka:
if (require("ggplot2")) {
   ggplot(lisiecki2005,
          aes(Time,
              d18O)) +
     geom_line() +
     scale_x_continuous(limits = c(0, 250),
                        name = "x 1000 years ago") +
     scale_y_reverse(name = bquote(delta^18*O)) +
     theme_bw()
   }



