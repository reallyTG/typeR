library(Rnightlights)


### Name: existsCtryNlDataFile
### Title: Check if a country admin level data file exists
### Aliases: existsCtryNlDataFile

### ** Examples

ctryCode <- "KEN"
admLevel <- "KEN_adm0"
message(Sys.time(), ": Data file for ", ctryCode, 
    ifelse(Rnightlights:::existsCtryNlDataFile(ctryCode, admLevel), 
        " FOUND", " NOT FOUND"))




