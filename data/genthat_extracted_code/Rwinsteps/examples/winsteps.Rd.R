library(Rwinsteps)


### Name: winsteps
### Title: Running Winsteps
### Aliases: winsteps as.winsteps print.winsteps
### Keywords: methods

### ** Examples

# Simulate scores for 15 items and 100 people
set.seed(82911)
b <- seq(-3, 3, length = 15)
theta <- rnorm(100, 1)
rmat <- data.frame(ifelse(rirf(b, theta)$p > runif(1500), 1, 0))

# Item and person labels
colnames(rmat) <- paste("i", 1:15, sep = "")
rmat$name <- paste("p", 1:100, sep = "")

# Create a command file object
cmd <- wcmd(title = "R2Winsteps Example", data = "example.dat",
  item1 = 1, ni = 15, name1 = 16, namelen = 5,
  labels = paste("i", 1:15, sep = ""), hlines = "Y")

# The last two steps require access to a local directory and
# are not run

# Write the data to file
# write.wdat(rmat, cmd)

# Run Winsteps, with default filenames, not saving the
# command file or other output to file
# out <- winsteps(cmd)



