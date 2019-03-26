library(reader)


### Name: parse.args
### Title: Function to collect arguments when running R from the command
###   line
### Aliases: parse.args

### ** Examples

parse.args(c("M=1","NAME=John","X=10.5"),coms=c("M","X","NAME"))
parse.args(c("N=1")) # invalid command entered, ignored with warning
temp.fn <- "tempScript1234.R"
# make a temporary R Script file to call using the command line
# not run # writeLines(c("require(reader)","parse.args(coms=c('M','X','NAME'))"),con=temp.fn)
bash.cmd <- "R --no-save < tempScript1234.R M=1 NAME=John X=10.5"
# run above command in the terminal, or using 'system' below:
# not run # arg <- system(bash.cmd)
# not run # unlink(temp.fn) # delete temporary file



