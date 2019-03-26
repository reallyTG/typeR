library(R2HTML)


### Name: HTMLStart
### Title: Start / Stop the automatic redirection of output to HTML files
### Aliases: HTMLStart HTMLStop
### Keywords: print IO file

### ** Examples


# Perform's one's own direct report

dir.create(file.path(tempdir(),"R2HTML"))
HTMLStart(file.path(tempdir(),"R2HTML"),HTMLframe=FALSE, Title="My report",autobrowse=FALSE)
as.title("This is my first title")
x <- 1
y<- 2
x+y
HTMLStop()


## Use for interactive teaching course
if (interactive()){
	dir.create(file.path(tempdir(),"R2HTML"))
	HTMLStart(file.path(tempdir(),"R2HTML"),echo=TRUE)
	as.title("Manipulation vectors")
	1:10
	sum(1:10)
	c(1:10,rep(3,4))
	HTMLStop()
}



