library(funr)


### Name: funr
### Title: funr: providing a simple command-line interface to R functions
### Aliases: cli funr rfun

### ** Examples

## show funr help
## terminal version: funr -h
funr()


## show rnorm help
## terminal version: funr -h rnorm
render_funr(funr(args=c("-h", "rnorm")))

## Generate a few random numbers
## terminal version: funr rnorm n=10
render_funr(funr(args=c("rnorm", "n=10")))




