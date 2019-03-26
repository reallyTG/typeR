library(BoSSA)


### Name: read_sqlite
### Title: Read a pplacer/guppy sqlite file
### Aliases: read_sqlite

### ** Examples

### the path to the sqlite and jplace files
sqlite_file <- system.file("extdata", "example.sqlite", package = "BoSSA")
jplace_file <- system.file("extdata", "example.jplace", package = "BoSSA")
pplace <- read_sqlite(sqlite_file,jplace_file)



