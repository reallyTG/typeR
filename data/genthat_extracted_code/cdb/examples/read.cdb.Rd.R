library(cdb)


### Name: read.cdb
### Title: Reads a cdb file
### Aliases: read.cdb
### Keywords: manip

### ** Examples

packages <- rownames(as.data.frame(installed.packages()))
set.seed(123)
a <- data.frame(key=sample(packages, 10, replace = TRUE),
                value=sample(packages, 10, replace = TRUE))
write.cdb(a, "Base.txt", type="txt")

b <- read.cdb("Base.txt", type="txt")
b

c <- read.cdb(system.file("extdata", "example.cdb",
                        package = "cdb"))
c



