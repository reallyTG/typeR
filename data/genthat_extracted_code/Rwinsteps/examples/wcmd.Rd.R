library(Rwinsteps)


### Name: wcmd
### Title: Winsteps Command File
### Aliases: wcmd as.wcmd read.wcmd write.wcmd print.wcmd
### Keywords: methods

### ** Examples

# Create
tempcmd <- tempfile()
cmd <- wcmd(title = "R2Winsteps Example", data = "example.dat",
  item1 = 1, ni = 15, name1 = 16, namelen = 5,
  labels = paste("i", 1:15, sep = ""), hlines = "Y")

# Write and read
write.wcmd(cmd, tempcmd)
cmd2 <- read.wcmd(tempcmd)



