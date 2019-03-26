library(exreport)


### Name: exreportAdd
### Title: Add elements to an existing exreport document
### Aliases: exreportAdd

### ** Examples

# Create an empty document:
report <- exreport("Test document")

# Create a reportable object (an experiment)
experiment <- expCreate(wekaExperiment, name="test-exp", parameter="fold")

# Add this object to the document
exreportAdd(report, experiment)



