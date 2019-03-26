library(pander)


### Name: Pandoc.brew
### Title: Brew in pandoc format
### Aliases: Pandoc.brew

### ** Examples

## Not run: 
##D text <- paste('# Header', '',
##D   'What a lovely list:\n<%=as.list(runif(10))%>',
##D   'A wide table:\n<%=mtcars[1:3, ]%>',
##D   'And a nice chart:\n\n<%=plot(1:10)%>', sep = '\n')
##D Pandoc.brew(text = text)
##D Pandoc.brew(text = text, output = tempfile(), convert = 'html')
##D Pandoc.brew(text = text, output = tempfile(), convert = 'pdf')
##D 
##D ## pi is awesome
##D Pandoc.brew(text='<%for (i in 1:5) {%>\n Pi has a lot (<%=i%>) of power: <%=pi^i%><%}%>')
##D 
##D ## package bundled examples
##D Pandoc.brew(system.file('examples/minimal.brew', package='pander'))
##D Pandoc.brew(system.file('examples/minimal.brew', package='pander'),
##D   output = tempfile(), convert = 'html')
##D Pandoc.brew(system.file('examples/short-code-long-report.brew', package='pander'))
##D Pandoc.brew(system.file('examples/short-code-long-report.brew', package='pander'),
##D   output = tempfile(), convert = 'html')
##D 
##D ## brew returning R objects
##D str(Pandoc.brew(text='Pi equals to <%=pi%>.
##D And here are some random data:\n<%=runif(10)%>'))
##D 
##D str(Pandoc.brew(text='# Header <%=1%>\nPi is <%=pi%> which is smaller then <%=2%>.
##D foo\nbar\n <%=3%>\n<%=mtcars[1:2,]%>'))
##D 
##D str(Pandoc.brew(text='<%for (i in 1:5) {%>
##D Pi has a lot (<%=i%>) of power: <%=pi^i%><%}%>'))
## End(Not run)



