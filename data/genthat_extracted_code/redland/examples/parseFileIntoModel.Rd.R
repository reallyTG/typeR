library(redland)


### Name: parseFileIntoModel
### Title: Parse the contents of a file into a model
### Aliases: parseFileIntoModel
###   parseFileIntoModel,Parser,World,character,Model-method

### ** Examples

world <- new("World")
storage <- new("Storage", world, "hashes", name="", options="hash-type='memory'")
model <- new("Model", world, storage, options="")
# Create the default "rdfxml" parser
parser <- new("Parser", world)
filePath <- system.file("extdata/example.rdf", package="redland")
parseFileIntoModel(parser, world, filePath, model)



