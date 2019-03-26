library(LDAvis)


### Name: createJSON
### Title: Create the JSON object to read into the javascript visualization
### Aliases: createJSON

### ** Examples

## Not run: 
##D data(TwentyNewsgroups, package="LDAvis")
##D # create the json object, start a local file server, open in default browser
##D json <- with(TwentyNewsgroups,
##D              createJSON(phi, theta, doc.length, vocab, term.frequency))
##D serVis(json) # press ESC or Ctrl-C to kill
##D 
##D # createJSON() reorders topics in decreasing order of term frequency
##D RJSONIO::fromJSON(json)$topic.order
##D 
##D # You may want to just write the JSON and other dependency files
##D # to a folder named TwentyNewsgroups under the working directory
##D serVis(json, out.dir = 'TwentyNewsgroups', open.browser = FALSE)
##D # then you could use a server of your choice; for example,
##D # open your terminal, type `cd TwentyNewsgroups && python -m SimpleHTTPServer`
##D # then open http://localhost:8000 in your web browser
##D 
##D # A different data set: the Jeopardy Questions+Answers data:
##D # Install LDAvisData (the associated data package) if not already installed:
##D # devtools::install_github("cpsievert/LDAvisData")
##D library(LDAvisData)
##D data(Jeopardy, package="LDAvisData")
##D json <- with(Jeopardy,
##D              createJSON(phi, theta, doc.length, vocab, term.frequency))
##D serVis(json) # Check out Topic 22 (bodies of water!)
##D 
##D # If you have a GitHub account, you can even publish as a gist
##D # which allows you to easily share with others!
##D serVis(json, as.gist = TRUE)
##D 
##D # Run createJSON on a cluster of machines to speed it up
##D system.time(
##D json <- with(TwentyNewsgroups,
##D              createJSON(phi, theta, doc.length, vocab, term.frequency))
##D )
##D #   user  system elapsed
##D # 14.415   0.800  15.066
##D library("parallel")
##D cl <- makeCluster(detectCores() - 1)
##D cl # socket cluster with 3 nodes on host 'localhost'
##D system.time(
##D  json <- with(TwentyNewsgroups,
##D    createJSON(phi, theta, doc.length, vocab, term.frequency,
##D      cluster = cl))
##D )
##D #   user  system elapsed
##D #  2.006   0.361   8.822
##D 
##D # another scaling method (svd + tsne)
##D library("tsne")
##D svd_tsne <- function(x) tsne(svd(x)$u)
##D json <- with(TwentyNewsgroups,
##D              createJSON(phi, theta, doc.length, vocab, term.frequency,
##D                         mds.method = svd_tsne,
##D                         plot.opts = list(xlab="", ylab="")
##D                         )
##D              )
##D serVis(json) # Results in a different topic layout in the left panel
##D 
## End(Not run)



