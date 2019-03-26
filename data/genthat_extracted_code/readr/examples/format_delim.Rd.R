library(readr)


### Name: format_delim
### Title: Convert a data frame to a delimited string
### Aliases: format_delim format_csv format_csv2 format_tsv

### ** Examples

tmp <- tempfile()
write_csv(mtcars, tmp)
head(read_csv(tmp))

# format_* is useful for testing and reprexes
cat(format_csv(head(mtcars)))
cat(format_tsv(head(mtcars)))
cat(format_delim(head(mtcars), ";"))

df <- data.frame(x = c(1, 2, NA))
format_csv(df, na = ".")

# Quotes are automatically as needed
df <- data.frame(x = c("a", '"', ",", "\n"))
cat(format_csv(df))

# A output connection will be automatically created for output filenames
# with appropriate extensions.
dir <- tempdir()
write_tsv(mtcars, file.path(dir, "mtcars.tsv.gz"))
write_tsv(mtcars, file.path(dir, "mtcars.tsv.bz2"))
write_tsv(mtcars, file.path(dir, "mtcars.tsv.xz"))



