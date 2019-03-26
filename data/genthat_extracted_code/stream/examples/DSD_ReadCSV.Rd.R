library(stream)


### Name: DSD_ReadCSV
### Title: Read a Data Stream from File
### Aliases: DSD_ReadCSV close_stream scale_stream

### ** Examples

# creating data and writing it to disk
stream <- DSD_Gaussians(k=3, d=5)
write_stream(stream, "data.txt", n=10, header = TRUE, sep=",")

# reading the same data back (as a loop)
stream2 <- DSD_ReadCSV("data.txt", sep=",", header = TRUE, loop=TRUE)
stream2

# get points (fist a single point and then 20 using loop)
get_points(stream2)
get_points(stream2, n=20)

# clean up
close_stream(stream2)
file.remove("data.txt")

# example with a part of the kddcup1999 data (take only cont. variables)
file <- system.file("examples", "kddcup10000.data.gz", package="stream")
stream <- DSD_ReadCSV(gzfile(file),
        take=c(1, 5, 6, 8:11, 13:20, 23:42), class=42, k=7)
stream

get_points(stream, 5, class = TRUE)


# plot 100 points (projected on the first two principal components)
plot(stream, n=100, method="pc")

close_stream(stream)



