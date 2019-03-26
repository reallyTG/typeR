library(R3port)


### Name: html_doc
### Title: Prints a HTML table, listing or plot to a a file or console
### Aliases: html_doc

### ** Examples


txt <- "<h1>Example</h1>"
tbl <- "<table><tr><td id='fcol'>table data</td><td>for custom table</td></tr></table>"
add <- "<p>Including some additional text</p>"
## Not run: 
##D   html_doc(c(txt,tbl,add),out=tempfile(fileext=".html"))
## End(Not run)



