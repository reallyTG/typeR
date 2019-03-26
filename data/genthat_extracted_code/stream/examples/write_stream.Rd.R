library(stream)


### Name: write_stream
### Title: Write a Data Stream to a File
### Aliases: write_stream

### ** Examples

# creating data and writing it to disk
stream <- DSD_Gaussians(k=3, d=5)
write_stream(stream, file="data.txt", n=10, class=TRUE)

#file.show("data.txt")

# clean up
file.remove("data.txt")



