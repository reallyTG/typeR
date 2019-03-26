library(pubchunks)


### Name: pub_guess_publisher
### Title: Guess the publisher from an XML document
### Aliases: pub_guess_publisher

### ** Examples

(x <- system.file("examples/pensoft_1.xml", package = "pubchunks"))
pub_guess_publisher(x)

(x <- system.file("examples/copernicus_2.xml", package = "pubchunks"))
pub_guess_publisher(x)

(x <- system.file("examples/peerj_1.xml", package = "pubchunks"))
pub_guess_publisher(x)

(x <- system.file("examples/hindawi_1.xml", package = "pubchunks"))
pub_guess_publisher(x)

(x <- system.file("examples/frontiers_1.xml", package = "pubchunks"))
pub_guess_publisher(x)

(x <- system.file("examples/elife_1.xml", package = "pubchunks"))
pub_guess_publisher(x)

(x <- system.file("examples/elsevier_1.xml", package = "pubchunks"))
pub_guess_publisher(x)

x <- system.file("examples/f1000research_1.xml", package = "pubchunks")
pub_guess_publisher(x)



