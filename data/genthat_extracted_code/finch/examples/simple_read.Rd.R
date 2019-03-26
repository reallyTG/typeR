library(finch)


### Name: simple_read
### Title: Parse a DarwinRecordSet and SimpleDarwinRecordSet files
### Aliases: simple_read

### ** Examples

## Not run: 
##D # SimpleDarwinRecordSet examples
##D file <- system.file("examples", "example_simple.xml", package = "finch")
##D simple_read(file)
##D file <- system.file("examples", "example_simple_fossil.xml",
##D   package = "finch")
##D simple_read(file)
##D 
##D # DarwinRecordSet examples
##D file <- system.file("examples", "example_classes_observation.xml",
##D   package = "finch")
##D simple_read(file)
##D 
##D file <- system.file("examples", "example_classes_specimen.xml",
##D   package = "finch")
##D simple_read(file)
##D 
##D # access elements of the object
##D file <- system.file("examples", "example_classes_specimen.xml",
##D   package = "finch")
##D res <- simple_read(file)
##D ## namespaces
##D res$meta
##D ## locations
##D res$locations
##D ## chunks, the first one
##D res$chunks[[1]]
## End(Not run)



