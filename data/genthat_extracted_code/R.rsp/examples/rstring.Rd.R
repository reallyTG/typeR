library(R.rsp)


### Name: rstring
### Title: Evaluates an RSP string and returns the generated string
### Aliases: rstring.default rstring rstring.RspString rstring.RspDocument
###   rstring.RspSourceCode rstring.function rstring.expression
### Keywords: file IO

### ** Examples

x <- rstring("A random integer in [1,100]: <%=sample(1:100, size=1)%>\n")
cat(x)

# Passing arguments
x <- rstring("A random integer in [1,<%=K%>]: <%=sample(1:K, size=1)%>\n", args=list(K=50))
cat(x)



