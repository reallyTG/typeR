library(R.rsp)


### Name: rcat
### Title: Evaluates an RSP string and outputs the generated string
### Aliases: rcat.default rcat rcat.RspString rcat.RspDocument
###   rcat.RspRSourceCode rcat.function rcat.expression rsource
###   rsource.default rsource.RspString rsource.RspDocument
###   rsource.RspRSourceCode rsource.function rsource.expression
### Keywords: print IO file

### ** Examples

rcat("A random integer in [1,100]: <%=sample(1:100, size=1)%>\n")

# Passing arguments
rcat("A random integer in [1,<%=K%>]: <%=sample(1:K, size=1)%>\n", args=list(K=50))





