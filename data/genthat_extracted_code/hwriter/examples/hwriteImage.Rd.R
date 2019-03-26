library(hwriter)


### Name: hwriteImage
### Title: Insert an HTML image
### Aliases: hwriteImage
### Keywords: interface

### ** Examples

## Creates a new web page 'test.html'
tmpdir <- tempdir()
p <- openPage('test.html', dirname=tmpdir)

## Insert an external image
img <- hwriteImage('http://www.ebi.ac.uk/~gpau/hwriter/iris1.jpg', center=TRUE)
hwrite(c(img,caption='Iris'), p, dim=c(2,1),
row.style=list(caption='text-align:center;background-color:#fac'),
row.names=FALSE, br=TRUE)

## Closes the web page
closePage(p)

## Opens a web browser to see the result
if (interactive()) try(browseURL(file.path(tmpdir, 'test.html')))



