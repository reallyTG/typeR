library(ini)


### Name: read.ini
### Title: Read and parse .ini file to list
### Aliases: read.ini

### ** Examples

## Create a new temp ini for reading
iniFile <- tempfile(fileext = '.ini')

sink(iniFile)
cat("; This line is a comment\n")
cat("# This one too!\n")
cat("[    Hello World]\n")
cat("Foo = Bar          \n")
cat("Foo1 = Bar=345 \n")
sink()

## Read ini
checkini <- read.ini(iniFile)

## Check structure
checkini
checkini$`Hello World`$Foo




