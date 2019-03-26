library(R.rsp)


### Name: HttpDaemon
### Title: The HttpDaemon class
### Aliases: HttpDaemon
### Keywords: classes IO internal

### ** Examples

if (interactive()) {
  if (!HttpDaemon$isStarted()) {
    # Start the web server
    rootPath <- system.file("rsp", package="R.rsp")
    HttpDaemon$start(rootPath=rootPath, port=8074, default="^index[.](html|.*)$")
  }
 
  browseURL("http://127.0.0.1:8074/")
}



