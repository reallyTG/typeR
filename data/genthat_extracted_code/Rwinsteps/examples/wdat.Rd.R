library(Rwinsteps)


### Name: wdat
### Title: Winsteps Data File
### Aliases: wdat read.wdat write.wdat
### Keywords: methods

### ** Examples

# Simulate data, with missings
set.seed(82911)
b <- seq(-3, 3, length = 15)
theta <- rnorm(100, 1)
rmat <- ifelse(rirf(b, theta)$p > runif(1500), 1, 0)
rmat[sample(1500, 30)] <- NA
rmat <- data.frame(rmat)

# Item and person labels
colnames(rmat) <- paste("i", 1:15, sep = "")
rmat$name <- paste("p", 1:100, sep = "")

# Create command file
tempdat <- tempfile()
cmd <- wcmd(title = "R2Winsteps Example", data = tempdat,
  item1 = 1, ni = 15, name1 = 16, namelen = 5,
  labels = paste("i", 1:15, sep = ""), hlines = "Y")

# Write to temp file and read back in
write.wdat(rmat, cmd, na = "N")
rmat2 <- read.wdat(cmd, na = "N")



