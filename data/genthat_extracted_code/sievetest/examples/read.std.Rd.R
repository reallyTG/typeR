library(sievetest)


### Name: read.std
### Title: Data input from file
### Aliases: read.std
### Keywords: IO

### ** Examples

# provided example file
fi <- system.file("lignite.csv",package="sievetest")
# inspect the file
file.show(fi)
# read the file
# there will be warning, because the file is prepared the way
# to show them, they are OK
a <- read.std(fi)
plot(a)



