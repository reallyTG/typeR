library(R.rsp)


### Name: rargs
### Title: Gets RSP arguments of an RSP document
### Aliases: rargs.default rargs
### Keywords: file IO internal

### ** Examples

path <- system.file("doc", package="R.rsp")
print(path)
print(dir(path=path))
args <- rargs(file="RSP_refcard.tex.rsp", path=path)
print(args)




