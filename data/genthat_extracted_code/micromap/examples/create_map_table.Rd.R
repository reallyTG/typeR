library(micromap)


### Name: create_map_table
### Title: Prepares A Polygon Table
### Aliases: create_map_table

### ** Examples

data("USstates")
head(USstates@data)
statePolys <- create_map_table(USstates, IDcolumn="ST")
head(statePolys)



