library(Rook)


### Name: Multipart-class
### Title: Class 'Multipart' and object 'Multipart'
### Aliases: Multipart-class Multipart
### Keywords: classes

### ** Examples

s <- Rhttpd$new()
## Not run: 
##D s$start(quiet=TRUE)
## End(Not run)
s$add(name="multi",
    app=function(env){
        req <- Request$new(env)
        res <- Response$new()
        res$write('<form enctype="multipart/form-data" method=POST>')
        res$write('Upload a file: <input type=file name=fileUpload>')
        res$write('<input type=submit></form><br>')
        post <- Multipart$parse(env)
        if (length(post)){
            poststr <- paste(capture.output(str(post),file=NULL),collapse='\n')
            res$write(c('<pre>',poststr,'</pre>'))
        }
        res$finish()
    }
)
## Not run: 
##D s$browse('multi') # Opens a browser window to the app.
## End(Not run)
s$remove(all=TRUE)
rm(s)



