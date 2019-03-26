library(openxlsx)


### Name: getNamedRegions
### Title: Get named regions
### Aliases: getNamedRegions

### ** Examples

## create named regions
wb <- createWorkbook()
addWorksheet(wb, "Sheet 1")

## specify region
writeData(wb, sheet = 1, x = iris, startCol = 1, startRow = 1)
createNamedRegion(wb = wb,
                  sheet = 1,
                  name = "iris",
                  rows = 1:(nrow(iris)+1),
                  cols = 1:ncol(iris))


## using writeData 'name' argument to create a named region
writeData(wb, sheet = 1, x = iris, name = "iris2", startCol = 10)

out_file <- tempfile(fileext = ".xlsx")
saveWorkbook(wb, out_file, overwrite = TRUE)

## see named regions
getNamedRegions(wb) ## From Workbook object
getNamedRegions(out_file) ## From xlsx file

## read named regions
df <- read.xlsx(wb, namedRegion = "iris")
head(df)

df <- read.xlsx(out_file, namedRegion = "iris2")
head(df)



