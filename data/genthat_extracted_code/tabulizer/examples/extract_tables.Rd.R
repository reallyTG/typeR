library(tabulizer)


### Name: extract_tables
### Title: extract_tables
### Aliases: extract_tables

### ** Examples

## No test: 
# simple demo file
f <- system.file("examples", "data.pdf", package = "tabulizer")

# extract all tables
extract_tables(f)

# extract tables from only second page
extract_tables(f, pages = 2)

# extract areas from a page
## full table
extract_tables(f, pages = 2, area = list(c(126, 149, 212, 462)))
## part of the table
extract_tables(f, pages = 2, area = list(c(126, 284, 174, 417)))

# return data.frames
extract_tables(f, pages = 2, output = "data.frame")
## End(No test)



