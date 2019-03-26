library(mimsy)


### Name: mimsy
### Title: 'mimsy' Calculate MIMS dissolved gas concentrations
### Aliases: mimsy

### ** Examples

data <-
  read.csv(file = system.file("extdata", "data.csv", package = "mimsy"),
           header = TRUE, stringsAsFactors = FALSE)

results <- mimsy(data, baromet.press = 981.2, units = 'hPa')




