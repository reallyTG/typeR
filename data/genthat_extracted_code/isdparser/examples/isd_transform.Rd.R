library(isdparser)


### Name: isd_transform
### Title: Transform ISD data variables
### Aliases: isd_transform

### ** Examples

path <- system.file('extdata/104270-99999-1928.gz', package = "isdparser")
(res <- isd_parse(path))
isd_transform(res)

lns <- readLines(path, encoding = "latin1")
# data.frame
(res <- isd_parse_line(lns[1]))
isd_transform(res)
# list
(res <- isd_parse_line(lns[1], as_data_frame = FALSE))
isd_transform(res)



