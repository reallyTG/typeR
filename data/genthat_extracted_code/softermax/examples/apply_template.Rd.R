library(softermax)


### Name: apply_template
### Title: Annotate Plate Read Data with Metadata from a Template
### Aliases: apply_template apply_template.data.frame
###   apply_template.softermax.plate

### ** Examples

## Not run: 
##D library(softermax)
##D 
##D d1 <- read_softmax_xml("myfile.xml")
##D p1 <- d1$experiments[["Experiment#1"]]$plates[["Plate#1"]]
##D template <- read_softmax_template("plate_template.txt")
##D 
##D annotated <- apply_template(p1, template)
## End(Not run)




