library(R2HTML)


### Name: HTML.latex
### Title: Insert a piece of LaTeX into a HTML file
### Aliases: HTML.latex as.latex
### Keywords: print IO file

### ** Examples

## Not run: 
##D 	 fic = HTMLInitFile()
##D 	 HTML.title("sample page",1,file=fic)  
##D 	 HTML("First paragraph",file=fic)
##D 	 cat("Some text and then an equation:",file=fic,append=TRUE)
##D 	 HTML(as.latex("\int_{-\infty}^{1}f(x)dx") ,file=fic)
##D 	 cat(". Nice isn't it?",file=fic,append=TRUE)
##D 	 HTML(as.latex("\int_{-\infty}^{1}f(x)dx",inline=FALSE) ,file=fic)   
##D 	 HTML(as.latex("\int_{-\infty}^{1}f(x)dx",inline=FALSE,count=TRUE) ,file=fic)   
##D 	 HTML(as.latex("\int_{-\infty}^{1}f(x)dx",inline=FALSE,label="My equation") ,file=fic)      
##D 	 cat("file:", fic, "is created")
##D 	 browseURL(fic)
## End(Not run)		   



