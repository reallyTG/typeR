library(zip)


### Name: unzip_process
### Title: Class for an external unzip process
### Aliases: unzip_process

### ** Examples

ex <- system.file("example.zip", package = "zip")
tmp <- tempfile()
up <- unzip_process()$new(ex, exdir = tmp)
up$wait()
up$get_exit_status()
dir(tmp)



