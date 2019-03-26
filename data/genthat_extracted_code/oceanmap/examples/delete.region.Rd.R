library(oceanmap)


### Name: delete.region
### Title: deletes a region from the region_definitions-definition file
### Aliases: delete.region
### Keywords: region_definitions

### ** Examples

## Example 1: Add region by supplying a one-row data.frame 
##            that holds the entire required information
data(region_definitions)
lion <- region_definitions[region_definitions$label == 'lion',] # selecting Gulf of Lions region
lion
junk <- lion 
junk$label <- 'junk' # rename region label
#add.region(junk) # add junk region
data(region_definitions) # reload region_definitions
region_definitions[,1:9]

## Example 2: Delete region
#delete.region("junk") # delete junk region
data(region_definitions) # reload region_definitions
region_definitions[,1:9]



