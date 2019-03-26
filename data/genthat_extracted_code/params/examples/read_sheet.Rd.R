library(params)


### Name: read_sheet
### Title: Read/Write sheets (automatically detect the file type and work
###   accordingly)
### Aliases: read_sheet write_sheet

### ** Examples


## read a excel sheet
sheet = read_sheet(system.file("extdata/example.xlsx", package = "params"))

## read a comma seperated sheet
csv = read_sheet(system.file("extdata/example.csv", package = "params"))

## read a tab seperate sheet
tsv = read_sheet(system.file("extdata/example.tsv", package = "params"))


# write sheets -------

## write a comma seperated sheet
write_sheet(sheet, "example.csv")

## write a tab seperated sheet
write_sheet(sheet, "example.tsv")

## write an excel seperated sheet
write_sheet(sheet, "example.xlsx")




