library(pubchunks)


### Name: pub_chunks
### Title: Extract chunks of data from articles
### Aliases: pub_chunks

### ** Examples

# a file path to an XML file
x <- system.file("examples/elsevier_1.xml", package = "pubchunks")
pub_chunks(x, "title")
pub_chunks(x, "authors")
pub_chunks(x, "acknowledgments")
pub_chunks(x, "refs")
pub_chunks(x, c("title", "refs"))

# works the same with the xml already in a string
xml <- paste0(readLines(x), collapse = "")
pub_chunks(xml, "title")

# also works if you've already read in the XML (with xml2 pkg)
xml <- paste0(readLines(x), collapse = "")
xml <- xml2::read_xml(xml)
pub_chunks(xml, "title")

# Hindawi
x <- system.file("examples/hindawi_1.xml", package = "pubchunks")
pub_chunks(x, "abstract")
pub_chunks(x, "authors")
pub_chunks(x, "aff")
pub_chunks(x, "title")
pub_chunks(x, c("abstract", "title", "authors", "refs"))

# Pensoft
x <- system.file("examples/pensoft_1.xml", package = "pubchunks")
pub_chunks(x, "abstract")
pub_chunks(x, "aff")
pub_chunks(x, "title")
pub_chunks(x, c("abstract", "title", "authors", "refs"))

# Peerj
x <- system.file("examples/peerj_1.xml", package = "pubchunks")
pub_chunks(x, "abstract")
pub_chunks(x, "authors")
pub_chunks(x, "aff")
pub_chunks(x, "title")
pub_chunks(x, c("abstract", "title", "authors", "refs"))

# Copernicus
x <- system.file("examples/copernicus_1.xml", package = "pubchunks")
pub_chunks(x, c("doi", "abstract", "title", "authors", "refs"))
pub_chunks(x, "aff")

# Frontiers
x <- system.file("examples/frontiers_1.xml", package = "pubchunks")
pub_chunks(x, "authors")
pub_chunks(x, "aff")
pub_chunks(x, c("doi", "abstract", "title", "authors", "refs"))

# eLife
x <- system.file("examples/elife_1.xml", package = "pubchunks")
pub_chunks(x, "authors")
pub_chunks(x, "aff")
pub_chunks(x, c("doi", "title", "authors", "refs"))

# f1000research
x <- system.file("examples/f1000research_1.xml", package = "pubchunks")
pub_chunks(x, "title")
pub_chunks(x, "aff")
pub_chunks(x, c("doi", "title", "authors", "keywords", "refs"))

# Many inputs at once
x <- system.file("examples/frontiers_1.xml", package = "pubchunks")
y <- system.file("examples/elife_1.xml", package = "pubchunks")
z <- system.file("examples/f1000research_1.xml", package = "pubchunks")
pub_chunks(list(x, y, z), c("doi", "title", "authors", "refs"))

## Not run: 
##D # using output of fulltext::ft_get()
##D if (requireNamespace("fulltext", quietly = TRUE)) {
##D   # single
##D   x <- fulltext::ft_get('10.7554/eLife.03032')
##D   pub_chunks(fulltext::ft_collect(x), sections="authors")
##D 
##D   # many
##D   dois <- c('10.1371/journal.pone.0086169', '10.1371/journal.pone.0155491', 
##D     '10.7554/eLife.03032')
##D   x <- fulltext::ft_get(dois)
##D   pub_chunks(fulltext::ft_collect(x), sections="authors")
##D }
## End(Not run)



