library(SchemaOnRead)


### Name: simpleProcessors
### Title: Automated Schema on Read Simple Processors
### Aliases: simpleProcessors
### Keywords: simpleProcessors

### ** Examples

## Load the needed library.
library(SchemaOnRead)

## Define a new processor.
newProcessor <- function(path, ...) {

  # Check the file existance and extensions.
  if (!SchemaOnRead::checkExtensions(path, c("xyz"))) return(NULL)

  ## As an example, attempt to read an XYZ file as a CSV file.
  read.csv(path, header = FALSE)

}

## Define a new processors list.
newProcessors <- c(newProcessor, SchemaOnRead::simpleProcessors())

# Use the new processors list.
schemaOnRead(path = "../inst/extdata", processors = newProcessors)



