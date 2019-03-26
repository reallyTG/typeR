library(prevR)


### Name: changeproj,prevR-method
### Title: Convert map projection of a object of class prevR.
### Aliases: changeproj changeproj,prevR-method changeproj-methods
### Keywords: manip spatial

### ** Examples

print(fdhs)
plot(fdhs, axes=TRUE, main="Projection: longitude/latitude")

fdhs2 <- changeproj(fdhs,
                   "+proj=utm +zone=30 +ellps=WGS84 +datum=WGS84 +units=m +no_defs")
print(fdhs2)
dev.new()
plot(fdhs2, axes=TRUE, main="Projection: UTM Zone 30")




