library(R.rsp)


### Name: rclean
### Title: Compiles an RSP document into a preprocessed and validated RSP
###   document
### Aliases: rclean.default rclean rclean.RspString rclean.RspDocument
### Keywords: file IO internal

### ** Examples

# RSP-embedded text to a preprocessed and validated RSP string
s <- rclean('Current <%@include content="time"%> is <%=Sys.time()%>\n')
print(s)



