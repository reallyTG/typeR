library(matconv)


### Name: mat2r
### Title: mat2r
### Aliases: mat2r

### ** Examples

matIn <- c("function [ dat ] = xlsReadPretty(varargin)", 
 "  didThing = 1*3;",
 "  dat = didThing / 3;",
 "end")
 mat2r(matIn, verbose = 0)$rCode

# "xlsReadPretty <- function(...){" 
# "\tvarargin <- list(...)"
# "  didThing <- 1*3"
# "  dat <- didThing / 3"
#"\treturn(dat)"
#"}"



