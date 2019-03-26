library(kutils)


### Name: writeCSV
### Title: Write CSV files with quotes same as MS Excel 2013 or newer
### Aliases: writeCSV

### ** Examples

set.seed(234)
x1 <- data.frame(x1 = c("a", "b,c", "b", "The \"Washington, DC\""),
      x2 = rnorm(4), stringsAsFactors = FALSE)
x1
fn <- tempfile(pattern = "testcsv", fileext = ".csv")
writeCSV(x1, file = fn)
readLines(fn)
x2 <- read.table(fn, sep = ",", header = TRUE, stringsAsFactors = FALSE)
all.equal(x1,x2)



