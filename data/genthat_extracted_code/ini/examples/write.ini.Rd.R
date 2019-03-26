library(ini)


### Name: write.ini
### Title: Write list to .ini file
### Aliases: write.ini

### ** Examples

## Create a new temp ini for writing
iniFile <- tempfile(fileext = '.ini')

## Create a new list holding our INI
newini <- list()
newini[[ "Hello World" ]] <- list(Foo = 'Bar')

## Write structure to file
write.ini(newini, iniFile)

## Check file content
## Not run: 
##D file.show(iniFile)
## End(Not run)




