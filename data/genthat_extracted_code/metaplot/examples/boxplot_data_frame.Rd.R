library(metaplot)


### Name: boxplot_data_frame
### Title: Boxplot Function for Data Frame
### Aliases: boxplot_data_frame

### ** Examples

library(magrittr)
library(dplyr)
boxplot_data_frame(Theoph,'Subject','conc')
boxplot_data_frame(Theoph %>% filter(conc > 0),
'conc','Subject', log = TRUE, ref = c(2,5),horizontal = FALSE)



