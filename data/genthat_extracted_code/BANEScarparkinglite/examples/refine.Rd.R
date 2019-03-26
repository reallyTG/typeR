library(BANEScarparkinglite)


### Name: refine
### Title: Clean up raw records
### Aliases: refine

### ** Examples

## Don't show: 
load(system.file("tests", "testthat", "data", "raw.rda", package = "BANEScarparkinglite"))
refined <- refine(raw)
## End(Don't show)
## No test: 
raw_data <- get_all_crude()
some_records <- raw_data[1:1000, ]

dim(some_records)
## 1000   16

df <- refine(raw_data)
dim(df)
## 813   7
## End(No test)



