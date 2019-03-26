library(R2HTML)


### Name: HTML.cormat
### Title: Write a correlation matrix with HTML formatting
### Aliases: HTML.cormat
### Keywords: IO multivariate

### ** Examples

	tmpfic=HTMLInitFile(tempdir(),CSSFile="http://www.stat.ucl.ac.be/R2HTML/Pastel.css")
	data(iris)
	HTML(as.title("Fisher Iris dataset / Correlation matrix - normal matrix"),
	     file=tmpfic)
	HTML(cor(iris[,1:4]), file=tmpfic)
	HTML(as.title("Fisher Iris dataset / Correlation matrix - traffic highlighting"),
	     file=tmpfic)
	HTML.cormat(cor(iris[,1:4]), file=tmpfic)

	# File is generated, you can call the browser:
	## Not run: browseURL(tmpfic)
	



