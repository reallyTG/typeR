library(hwriter)


### Name: openPage
### Title: HTML document/page management
### Aliases: openPage closePage
### Keywords: interface

### ** Examples

## Creates a new web page 'test.html' in the R temporary directory
tmpdir <- tempdir()
p <- openPage('test.html', dirname=tmpdir,
              link.css='http://www.ebi.ac.uk/~gpau/hwriter/hwriter.css')
hwrite('Iris example', p, center=TRUE, heading=1)
hwrite(paste('This famous (Fisher\'s or Anderson\'s) iris data set',
             'gives the measurements in centimeters of the variables',
             'sepal length and width and petal length and width, respectively,',
             'for 50 flowers from each of 3 species of iris.'),
       p, class='king')
hwrite(iris, p, row.bgcolor='#ffffaa')
closePage(p)

## Opens a web browser on the web page
if (interactive()) try(browseURL(file.path(tmpdir, 'test.html')))



