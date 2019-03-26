library(R2HTML)


### Name: HTMLInitFile
### Title: Begins / Ends a new HTML report output
### Aliases: HTMLInitFile HTMLEndFile HTMLSetFile HTMLGetFile
### Keywords: print IO file

### ** Examples

	# Store in target the name of a output file
	dir.create(file.path(tempdir(),"R2HTML"))
	target <- HTMLInitFile(file.path(tempdir(),"R2HTML"),"index", BackGroundColor="#BBBBEE")
	# Use target to write a dataframe
	HTML(as.title("Here is the data frame"),file=target)
	HTML("<br>Don't forget to use the CSS file in order to benefit from fixed size police",
	     file=target)
	tmp <- as.data.frame(matrix(rnorm(100),ncol=10))
	HTML(tmp,file=target)
	HTMLEndFile()



