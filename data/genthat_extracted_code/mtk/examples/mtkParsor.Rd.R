library(mtk)


### Name: mtkParsor
### Title: The constructor of the class 'mtkParsor'
### Aliases: mtkParsor

### ** Examples

# Create a parsor with the file "inst/extdata/WWDM.xml".

# Specify the XML file's name
	xmlFile <- "WWDM_morris.xml"

#  find where the examples are held.
#  This is only necessary for the example since the system does 
#  not know where the file "WWDM.xml" is kept.
	xmlFilePath <- paste(path.package("mtk", quiet = TRUE),
		"/extdata/",xmlFile,sep = "") 

## Create a parsor from the xml file
	parsor <- mtkParsor(xmlFilePath)

# Create an empty workflow.
	workflow <- mtkExpWorkflow()

# Parse the XML file and initialize the workflow 
# with the data extracted from the XML file.
	run(parsor, workflow) 

# Run the workflow and report the results of the sensitivity analysis

	run(workflow)
	summary(workflow)



