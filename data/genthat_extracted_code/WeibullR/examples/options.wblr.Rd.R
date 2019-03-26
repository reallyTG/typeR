library(WeibullR)


### Name: options.wblr
### Title: Options list for 'wblr' Objects
### Aliases: options.wblr

### ** Examples

## backup options ##
wblr.defaults <- options.wblr()

## setting new options ##
options.wblr(S=5e5,ci=0.99)

## listing options ##
options.wblr()
options.wblr()$main

## restore options ##
options.wblr(wblr.defaults)



