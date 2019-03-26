library(Smisc)


### Name: dataIn
### Title: A flexible way to import data into R.
### Aliases: dataIn
### Keywords: misc

### ** Examples

# Write a simple data set
some.data <-data.frame(a=rnorm(10), b=rpois(10, 5))
write.csv(some.data, file="tmp.file.csv", row.names=FALSE)
save(some.data, file="tmp.file.Rdata")

A <- dataIn("tmp.file.csv")
B <- dataIn("tmp.file.Rdata")
C <- dataIn(some.data)

# We expect these to be equivalent (this should be TRUE)
all(c(dframeEquiv(A, B, verbose=FALSE)$equiv,
      dframeEquiv(B, C, verbose=FALSE)$equiv,
      dframeEquiv(A, C, verbose=FALSE)$equiv))

# Delete the files
unlink(c("tmp.file.csv", "tmp.file.Rdata"))

# Loading data from a package
more.data <- dataIn("datasets::AirPassengers")
print(more.data)

# remove example objects
rm(A, B, C, more.data, some.data)





