library(R2HTML)


### Name: HTMLstem
### Title: Insert a stem-and-leaf plot in the HTML output
### Aliases: HTMLstem
### Keywords: IO univar

### ** Examples

	data(islands)
	tmpfic=paste(tempfile(),"html",sep=".")
	HTMLstem(log10(islands),tmpfic)
	cat("\n stem-and-leaf writen to:", tmpfic,"\n")



