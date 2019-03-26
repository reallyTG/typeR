library(R.rsp)


### Name: rcode
### Title: Compiles an RSP document and returns the generated source code
###   script
### Aliases: rcode.default rcode rcode.RspString rcode.RspDocument
### Keywords: file IO internal

### ** Examples

# RSP-embedded text to an R script
code <- rcode("Current time is <%=Sys.time()%>\n")
cat(code, sep="\n")

# RSP-embedded text to a shell script
code <- rcode("Current time is <%=date%>\n", language="sh")
cat(code, sep="\n")



