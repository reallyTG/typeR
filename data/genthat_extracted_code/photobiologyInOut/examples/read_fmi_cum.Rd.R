library(photobiologyInOut)


### Name: read_fmi_cum
### Title: Read daily cummulated solar spectrum data file(s).
### Aliases: read_fmi_cum read_m_fmi_cum

### ** Examples


file.name <- system.file("extdata", "2014-08-21_cum.hel", 
                         package = "photobiologyInOut", mustWork = TRUE)
fmi.spct <- read_fmi_cum(file = file.name)
  



