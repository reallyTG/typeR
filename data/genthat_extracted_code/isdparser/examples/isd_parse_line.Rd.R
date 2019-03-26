library(isdparser)


### Name: isd_parse_line
### Title: Parse NOAA ISD/ISH data files - line by line
### Aliases: isd_parse_line

### ** Examples

path <- system.file('extdata/024130-99999-2016.gz', package = "isdparser")
lns <- readLines(path, encoding = "latin1")
isd_parse_line(lns[1])
isd_parse_line(lns[1], FALSE)

res <- lapply(lns[1:1000], isd_parse_line)
library("data.table")
library("tibble")
as_data_frame(
 rbindlist(res, use.names = TRUE, fill = TRUE)
)

# only control + mandatory sections
isd_parse_line(lns[10], additional = FALSE)
isd_parse_line(lns[10], additional = TRUE)



