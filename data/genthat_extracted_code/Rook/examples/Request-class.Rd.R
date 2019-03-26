library(Rook)


### Name: Request-class
### Title: Class 'Request'
### Aliases: Request-class Request
### Keywords: classes

### ** Examples

#
# The following example prints out the result of each method.
# 
ls_str <- function(s) paste(capture.output(str(s),file=NULL),collapse='\n')
s <- Rhttpd$new()
## Not run: 
##D s$start(quiet=TRUE)
## End(Not run)
s$add(name="request",
    app=function(env){
        req <- Request$new(env)
        res <- Response$new()
        res$set_cookie('imacookie','42')
        action <- req$to_url('/foo',bar=1,baz='three')
        res$write('<form enctype="multipart/form-data" method=POST action="')
        res$write(action)
        res$write('">')
        res$write('Upload a file: <input type=file name=fileUpload>')
        res$write('<input type=submit></form><br><pre>')
        res$write(c('parseable_data: ',req$parseable_data(),'\n'))
        res$write(c('url: ',req$url(),'\n'))
        res$write(c('request_method: ',req$request_method(),'\n'))
        res$write(c('GET: ',ls_str(req$GET()),'\n'))
        res$write(c('post: ',req$post(),'\n'))
        res$write(c('media_type: ',req$media_type(),'\n'))
        res$write(c('query_string: ',req$query_string(),'\n'))
        res$write(c('fullpath: ',req$fullpath(),'\n'))
        res$write(c('referer: ',req$referer(),'\n'))
        res$write(c('cookies: ',ls_str(req$cookies()),'\n'))
        res$write(c('content_charset: ',req$content_charset(),'\n'))
        res$write(c('head: ',req$head(),'\n'))
        res$write(c('accept_encoding: ',req$accept_encoding(),'\n'))
        res$write(c('content_length: ',req$content_length(),'\n'))
        res$write(c('form_data: ',req$form_data(),'\n'))
        res$write(c('xhr: ',req$xhr(),'\n'))
        res$write(c('params: ',ls_str(req$params()),'\n'))
        res$write(c('media_type_params:\n',ls_str(req$media_type_params()),'\n'))
        res$write(c('user_agent: ',req$user_agent(),'\n'))
        res$write(c('put: ',req$put(),'\n'))
        res$write(c('get: ',req$get(),'\n'))
        res$write(c('path: ',req$path(),'\n'))
        res$write(c('body: ',ls_str(req$body()),'\n'))
        res$write(c('port: ',req$port(),'\n'))
        res$write(c('host_with_port: ',req$host_with_port(),'\n'))
        res$write(c('scheme: ',req$scheme(),'\n'))
        res$write(c('ip: ',req$ip(),'\n'))
        res$write(c('options: ',req$options(),'\n'))
        res$write(c('to_url: ',req$to_url('foo',bar=1,baz='two'),'\n'))
        res$write(c('host: ',req$host(),'\n'))
        res$write(c('POST: ',ls_str(req$POST()),'\n'))
        res$write(c('trace: ',req$trace(),'\n'))
        res$write(c('script_name: ',req$script_name(),'\n'))
        res$write(c('content_type: ',req$content_type(),'\n'))
        res$write(c('delete: ',req$delete(),'\n'))
        res$write(c('path_info: ',req$path_info(),'\n'))
        res$write(c('\nRac env: ',ls_str(as.list(env)),'\n'))
        res$finish()
    }
)
## Not run: 
##D s$browse('request') # Opens a browser window to the app.
## End(Not run)
s$remove(all=TRUE)
rm(s)



