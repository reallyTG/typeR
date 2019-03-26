library(sfsmisc)


### Name: str_data
### Title: Overview on All Datasets in an R Package
### Aliases: str_data
### Keywords: datasets utilities documentation

### ** Examples

str_data("cluster")

str_data("datasets", max=0, give.attr = FALSE)

## Filtering (and return value)
dfl <- str_data("datasets", filterFUN=is.data.frame)
str(df.d <- dfl$datasets)
## dim() of all those data frames:
t(sapply(unlist(df.d), function(.) dim(get(.))))

### Data sets in all attached packages but "datasets" (and stubs):
s <- search()
(Apkgs <- sub("^package:", '', s[grep("^package:", s)]))
str_data(Apkgs[!Apkgs %in% c("datasets", "stats", "base")])



