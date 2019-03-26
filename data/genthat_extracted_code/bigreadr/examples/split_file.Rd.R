library(bigreadr)


### Name: split_file
### Title: Split file every nlines
### Aliases: split_file get_split_files

### ** Examples

tmp <- fwrite2(iris)
infos <- split_file(tmp, 100)
str(infos)
get_split_files(infos)



