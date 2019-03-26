library(metaplot)


### Name: corsplom_data_frame
### Title: Correlated Scatterplot Matrix Function for Data Frame
### Aliases: corsplom_data_frame

### ** Examples


library(magrittr)
library(dplyr)
library(csv)
x <- as.csv(system.file(package = 'metaplot', 'extdata/theoph.csv'))
x %<>% pack
# setOption(gg = TRUE)
x %>% metaplot(lKe, lKa, lCl)
x %>% metaplot(
  lKe, lKa, lCl,
  col = 'black',smooth.col = 'red', pin.col = 'red',
  dens.col='blue',dens.alpha = 0.1
)



