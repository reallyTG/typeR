## ----echo = FALSE--------------------------------------------------------
knitr::opts_chunk$set( fig.width =  183 * 0.0393701,  # nature's two col width
                       message = FALSE,
                       warning = FALSE)

## ---- echo = FALSE-------------------------------------------------------
references <- data.frame(Dataset = c("lisiecki2005", "spratt2016"),
                         Source = c("Lisiecki, L.E. and M.E. Raymo. 2005. A Pliocene-Pleistocene stack of 57 globally distributed benthic D18O records. Paleoceanography, Vol. 20, PA1003, <https://doi.org/10.1029/2004PA001071>",
                                    "Spratt, Rachel M. and Lorraine E. Lisiecki 2016. A Late Pleistocene sea level stack. Climate of the Past. Vol. 12, 1079-1092, <https://doi.org/10.5194/cp-12-1-2016>"))

knitr::kable(references)

## ------------------------------------------------------------------------
library(gsloid)
str(lisiecki2005)

## ------------------------------------------------------------------------
str(spratt2016)

## ------------------------------------------------------------------------
str(LR04_MISboundaries)

## ------------------------------------------------------------------------
library(ggplot2)


ggplot(lisiecki2005, 
       aes(Time,
           d18O)) +
  geom_line() +
  scale_x_continuous(limits = c(0, 250),
                     name = "x 1000 years ago") +
  scale_y_reverse(name = bquote(delta^18*O)) +
  theme_bw()

## ------------------------------------------------------------------------
ggplot(spratt2016, 
       aes(age_calkaBP,
           SeaLev_shortPC1)) +
  geom_line() +
  scale_x_continuous(limits = c(0, 250),
                     name = "x 1000 years ago") +
  scale_y_continuous(name = "Sea Level, meters above present day") +
  theme_bw()

## ------------------------------------------------------------------------
# subset the MIS data for the last 250 ka years
mis_last_250ka <- LR04_MISboundaries[LR04_MISboundaries$LR04_Age_ka_start <= 250, ]

# plot the oxygen istope data line on top of the MIS lines
ggplot() +
  geom_vline(data = mis_last_250ka,          # add MIS lines
             aes(xintercept = LR04_Age_ka_start),
             colour = "blue") +
  annotate("text", 
           label = mis_last_250ka$label_MIS, 
           x = mis_last_250ka$LR04_Age_ka_mid,
           y = c(rep(3.0, 4), 
                 seq(3.2, 2.7, length.out = 6), 
                 rep(3.0, 2)),
           size = 3) +
  geom_line(data = lisiecki2005,                # add d18O line
            aes(Time,
                d18O)) +  
  scale_x_continuous(limits = c(0, 250),
                     name = "x 1000 years ago") +
  scale_y_reverse(name = bquote(delta^18*O)) +
  theme_bw()

## ------------------------------------------------------------------------
ggplot() +
  geom_segment(data = mis_last_250ka, # add MIS lines
               aes(x =    LR04_Age_ka_end,
                   xend = LR04_Age_ka_start,
                   y =    seq(3, 2.5, length.out = nrow(mis_last_250ka)),
                   yend = seq(3, 2.5, length.out = nrow(mis_last_250ka))),
               colour = "blue",
               size = 1) +
  annotate("text", 
           label = mis_last_250ka$label_MIS, 
           x =     mis_last_250ka$LR04_Age_ka_mid,
           y = c(seq(2.9, 2.7, length.out = 4), 
                 seq(3.1, 2.8, length.out = 5),
                 seq(2.4, 2.3, length.out = 3)),
           size = 3) +
  geom_line(data = lisiecki2005,                # add d18O line
            aes(Time,
                d18O)) +  
  scale_x_continuous(limits = c(0, 250),
                     name = "x 1000 years ago") +
  scale_y_reverse(name = bquote(delta^18*O)) +
  theme_bw()

## ------------------------------------------------------------------------
ggplot() +
  annotate("rect", 
           xmin = mis_last_250ka$LR04_Age_ka_end, 
           xmax = mis_last_250ka$LR04_Age_ka_start, 
           ymin = -Inf, 
           ymax = Inf,
        alpha = .2,
        fill = rep(c("grey70", "white"), 
                   nrow(mis_last_250ka)/2)) +
  annotate("text", 
           label = mis_last_250ka$label_MIS, 
           x =     mis_last_250ka$LR04_Age_ka_mid,
           y = c(rep(3, 4), 
                 seq(3.1, 2.8, length.out = 5),
                 rep(3, 3)),
           size = 3) +
  geom_line(data = lisiecki2005,                # add d18O line
            aes(Time,
                d18O)) +  
  scale_x_continuous(limits = c(0, 250),
                     name = "x 1000 years ago") +
  scale_y_reverse(name = bquote(delta^18*O)) +
  theme_bw()

## ------------------------------------------------------------------------
ggplot() +
  annotate("rect", 
           xmin = mis_last_250ka$LR04_Age_ka_end , 
           xmax = mis_last_250ka$LR04_Age_ka_start, 
           ymin = -Inf, 
           ymax = Inf,
        alpha = .2,
        fill = rep(c("grey70", "white"), 
                   nrow(mis_last_250ka)/2)) +
  annotate("text", 
           label = mis_last_250ka$label_MIS, 
           x =     mis_last_250ka$LR04_Age_ka_mid, 
           y = c(rep(9, 4), 
                 seq(8.1, 9.9, length.out = 5),
                 rep(9, 3)),
           size = 3) +
  # add in other geoms here...
  scale_x_continuous(limits = c(0, 250),
                     name = "x 1000 years ago") +
  scale_y_continuous(limits = c(0, 10),
                  name = "Some other variable (units)") +
  theme_bw()

