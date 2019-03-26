library(metaplot)


### Name: scatter_data_frame
### Title: Scatterplot Function for Data Frame
### Aliases: scatter_data_frame

### ** Examples

library(magrittr)
library(dplyr)
attr(Theoph$conc,'label') <- 'theophylline concentration'
attr(Theoph$conc,'guide') <- 'mg/L'
attr(Theoph$Time,'label') <- 'time'
attr(Theoph$Time,'guide') <- 'h'
attr(Theoph$Subject,'guide') <- '////'
scatter_data_frame(Theoph, 'conc', 'Time')
scatter_data_frame(Theoph, 'conc','Time', 'Subject')
scatter_data_frame(Theoph, 'conc','Time', facets = 'Subject')
scatter_data_frame(Theoph %>% filter(conc > 0), 'conc','Time', 'Subject',ylog = TRUE, yref = 5)
scatter_data_frame(Theoph, 'conc','Time', 'Subject',ylog = TRUE, yref = 5)
scatter_data_frame(Theoph, 'conc','Time', 'Subject',ysmooth = TRUE)
scatter_data_frame(Theoph, 'conc','Time', 'Subject',ysmooth = TRUE,global = TRUE)
scatter_data_frame(Theoph, 'conc','Time', conf = TRUE, loc = 3, yref = 6)
scatter_data_frame(Theoph, 'conc','Time', conf = TRUE, loc = 3, yref = 6)



