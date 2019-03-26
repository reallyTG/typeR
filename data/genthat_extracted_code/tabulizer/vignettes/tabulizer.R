## ------------------------------------------------------------------------
library("tabulizer")
f <- system.file("examples", "data.pdf", package = "tabulizer")

# extract table from first page of example PDF
tab <- extract_tables(f, pages = 1)
head(tab[[1]])

## ------------------------------------------------------------------------
f2 <- "https://github.com/leeper/tabulizer/raw/master/inst/examples/data.pdf"
extract_tables(f2, pages = 2)

## ------------------------------------------------------------------------
# Extract tables by deciding for each page individually
extract_tables(f2, method = "decide")

## ------------------------------------------------------------------------
# Extract tables by using "lattice" method
extract_tables(f2, pages = 2, method = "lattice")

## ------------------------------------------------------------------------
# Extract tables by using "stream" method
extract_tables(f2, pages = 2, method = "stream")

## ------------------------------------------------------------------------
# attempt to coerce tables to data.frames
extract_tables(f, pages = 2, output = "data.frame")

## ------------------------------------------------------------------------
# extract tables to CSVs
extract_tables(f, output = "csv")

## ------------------------------------------------------------------------
str(extract_tables(f, pages = 2, guess = TRUE, output = "data.frame"))
str(extract_tables(f, pages = 2, area = list(c(126, 149, 212, 462)), guess = FALSE, output = "data.frame"))
str(extract_tables(f, pages = 2, area = list(c(126, 284, 174, 417)), guess = FALSE, output = "data.frame"))

## ------------------------------------------------------------------------
a2 <- list(c(126, 149, 212, 462), c(126, 284, 174, 417))
str(extract_tables(f, pages = c(2,2), area = a2, guess = FALSE, output = "data.frame"))

