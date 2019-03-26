library(NCA)


### Name: nca_output
### Title: display the result of the NCA analysis
### Aliases: nca_output
### Keywords: functions

### ** Examples

# Use the result of the nca command:
data(nca.example)
data <- nca.example
model <- nca_analysis(data, c(1, 2), 3)

# This shows the summaries in the console
nca_output(model)

# Suppress the summaries and display the plots
nca_output(model, plots=TRUE, summaries=FALSE)

# Suppress the summaries and display the bottlenecks
nca_output(model, bottlenecks=TRUE, summaries=FALSE)

# Show the results of the statistical significance test (p-value)
# Make sure to set test.rep in nca_analysis
nca_output(model, test=TRUE)

# Show all four
nca_output(model, plots=TRUE, bottlenecks=TRUE, test=TRUE)

# Per independent variable, export plots and summaries to PDF files,
# and export all the bottleneck tables to a single PDF file
## No test: 
nca_output(model, plots=TRUE, bottlenecks=TRUE, pdf=TRUE)
## End(No test)

# Use the path option to export to an existing directory
outdir <- '/tmp' ## Don't show: 
outdir <- tempdir()
## End(Don't show)
nca_output(model, plots=TRUE, pdf=TRUE, path=outdir)



