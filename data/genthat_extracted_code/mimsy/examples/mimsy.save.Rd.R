library(mimsy)


### Name: mimsy.save
### Title: 'mimsy.save' Save output to an Excel workbook
### Aliases: mimsy.save

### ** Examples

data <-
  read.csv(file = system.file("extdata", "data.csv", package = "mimsy"),
           header = TRUE, stringsAsFactors = FALSE)

results <- mimsy(data, baromet.press = 981.2, units = 'hPa')

mimsy.save(results, file = file.path(tempdir(), "results.xlsx"))




