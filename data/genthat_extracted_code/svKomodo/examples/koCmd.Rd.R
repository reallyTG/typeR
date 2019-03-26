library(svKomodo)


### Name: koCmd
### Title: Connect to the SciViews-K (Komodo Edit/IDE) socket server and
###   run javascript code in Komodo
### Aliases: koCmd
### Keywords: IO

### ** Examples

## Not run: 
##D ## Make sure you have started Komodo Edit or IDE with the SciViews-K extension
##D ## installed on the same machine, and the socket server started and then...
##D 
##D ## Send JavaScript commands to Komodo
##D ## Alert box in Komodo, and then reply to R
##D koCmd(c('alert("Hello from R!");',
##D     'sv.socket.serverWrite("Hello from OpenKomodo (" + ko.interpolate.currentFilePath() + ")");'))
##D 
##D ## Open a web page wih Komodo configuration
##D koCmd("ko.open.URI('about:config','browser');")
##D 
##D ## Get info from Komodo
##D koCmd("sv.socket.serverWrite(ko.logging.getStack());")
##D 
##D ## Passing a large amount of data to Komodo, and then, back to R
##D koCmd(paste('sv.socket.serverWrite("', rep(paste(iris, collapse = "\\n"), 10), '");', sep = ""))
##D 
##D ## It is easier to use 'data =' instead of paste() for constructing the JS command
##D koCmd('alert("<<<data>>>");', data = search())
##D 
##D ## Using a named list for data to replace in the cmd
##D koCmd('alert("This is R version <<<major>>>.<<<minor>>>");', R.version)
##D 
##D ## Sending incorrect javascript instruction
##D koCmd('nonexistingJSfunction();')
##D ## Should return something like:
##D ## "ReferenceError: nonexistingJSfunction is not defined"
##D 
##D 
##D ## Sending RjsonP (Rjson with padding) instruction to Komodo
##D koCmd("Hello with RjsonP!", type = "rjsonp", pad = "alert")
##D 
##D ## This is more useful to pass complex R objects to Komodo
##D koCmd(head(iris), type = "rjsonp", pad = "sv.socket.serverWrite")
##D 
##D 
##D ## Send simple text (no evaluation) to the Komodo R console
##D koCmd("Hello again from R!", type = "output")
## End(Not run)



