library(OpenMx)


### Name: imxReportProgress
### Title: Report backend progress
### Aliases: imxReportProgress

### ** Examples

library(OpenMx)

previousLen <<- 0

easyReportProcess <- function(msg) {
	imxReportProgress(msg, previousLen)
	previousLen <<- nchar(msg)
}

demo <- function() {
	easyReportProcess("abc123")
	Sys.sleep(1)
	easyReportProcess("this is much longer")
	Sys.sleep(1)
	easyReportProcess("this is short")
	Sys.sleep(1)
	easyReportProcess("almost done")
	Sys.sleep(1)
	easyReportProcess("")
	cat("DONE!", fill=TRUE)
}

## Not run: demo()



