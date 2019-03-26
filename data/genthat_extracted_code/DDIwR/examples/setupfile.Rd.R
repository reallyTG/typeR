library(DDIwR)


### Name: setupfile
### Title: Create setup files for SPSS, Stata, SAS and R
### Aliases: setupfile
### Keywords: functions

### ** Examples

test <- list()

test$varlab <- list(
"ID" = "Questionnaire ID",
"V1" = "Label for the first variable",
"V2" = "Label for the second variable",
"V3" = "Label for the third variable"
)


test$vallab$V1 <- c(
"No"             =  0, 
"Yes"            =  1,
"Not answered"   = -1
)


test$vallab$V2 <- c(
"Verry little"   =  1, 
"Little"         =  2,
"So, so"         =  3,
"Much"           =  4,
"Very much"      =  5,
"Not applicable" = -7,
"Don't know"     = -8,
"Not answered"   = -9
)


test$vallab$V3 <- c(
"No"             =  0, 
"Yes"            =  1,
"Not answered"   = -1
)


# 
###   IMPORTANT:
##### make sure to set the working directory to a directory with read/write permissions
###
# setwd("/path/to/read/write/directory")


##### then run these commands
###
# path.to.csv <- file.path(system.file(package = "DDIwR"), "data", "test.csv.gz")
# setupfile(test, trymiss = TRUE, csv = path.to.csv, uniqueid = "ID")


# setupfile(test, csv = path.to.csv, type="Stata", SD=";")


##### other types of possible utilizations, using paths to specific files
###
# setupfile("/path/to/the/metadata/file.xml", csv="/path/to/csv/file.csv")


##### if the metadata is saved to an .R file containing a list
###
# setupfile("/path/to/the/metadata/file.R", csv="/path/to/csv/file.csv")


##### or in batch mode, specifying entire directories
###
# setupfile("/path/to/the/metadata/directory", csv="/path/to/csv/directory")




