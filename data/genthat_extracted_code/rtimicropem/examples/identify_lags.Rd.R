library(rtimicropem)


### Name: identify_lags
### Title: Identify time gaps in the data collection period
### Aliases: identify_lags

### ** Examples

micropem_na <- convert_output(system.file("extdata", "file_with_na.csv",
                                          package = "rtimicropem"))
micropem_na$plot()
identify_lags(micropem_na)




