library(ActisoftR)


### Name: plot_long
### Title: Plots with-in participant activity intervals (SLEEP, REST,
###   ACTIVE, etc) in 24 hour sections.
### Aliases: plot_long

### ** Examples

library("dplyr")
data(act)
act[act$subject_ID == 1 & act$interval_type != "ACTIVE",] %>%
plot_long(., si = c(3, 2.5, 2, 1.5),
             tz2 = "Pacific/Auckland",
             acolor = c("#D55E00", "black", "#56B4E9"))



