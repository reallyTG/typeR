library(mtk)


### Name: setXMLFilePath-methods
### Title: The 'setXMLFilePath' function
### Aliases: setXMLFilePath-methods setXMLFilePath

### ** Examples

# Specify the XML file's name
	xmlFile <- "WWDM_morris.xml"

## Find where the example XML file is held in the 'mtk' package. 
## (This line is nit useful for real life example!)
	xmlFile <- paste(path.package("mtk", quiet = TRUE),
		"/extdata/",xmlFile,sep = "") 

# Create a XML parsor.		
	parsor <- mtkParsor(xmlFile)

# Create an empty workflow.
	workflow <- mtkExpWorkflow()

# Parse the XML file and initialize the workflow 
# with the data extracted from the XML file.
	run(parsor, workflow) 

# Run the workflow
	run(workflow)
	
# If you want to parse another XML file with the same parsor,
# just changes the XML file to "inst/extdata/ishigami_fast.xml".

	xmlFile <- "ishigami_fast.xml"

# Find where the example XML file is held in the 'mtk' package. 
# (This line is nit useful for real life example!)
	xmlFile <- paste(path.package("mtk", quiet = TRUE),
		"/extdata/",xmlFile,sep = "") 

# Change the XML file to the new one 
	setXMLFilePath(parsor, xmlFile)

# Parse the new XML file and initialize the workflow
# with the data extracted from the XML file.
	run(parsor, workflow) 

# Run the workflow
	run(workflow)




