library(Smisc)


### Name: openDevice
### Title: Opens a graphics device based on the filename extension
### Aliases: openDevice
### Keywords: misc

### ** Examples

# Open 3 example devices
openDevice("ex1.pdf", height=6, width=12)
plot(1:10, 1:10)

openDevice("ex1.jpg")
plot(1:10, 1:10)

openDevice("ex1.png")
plot(1:10, 1:10)

# List the devices and their filenames
dev.list()
dir(pattern = "ex1")

# Turn each of the 3 devices off
for (i in 1:3) {
  dev.off(dev.list()[length(dev.list())])
}

# Delete the created files
unlink(c("ex1.pdf","ex1.png","ex1.jpg"))

# List the current devices
dev.list()




