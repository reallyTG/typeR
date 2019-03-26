library(descr)


### Name: fwf2csv
### Title: Fast conversion of a fwf file into a csv one
### Aliases: fwf2csv

### ** Examples

## Not run: 
##D tab <- rbind(c("state",   1,  2),
##D              c("municp",  3,  5),
##D              c("house",   6,  8),
##D              c("cond",    9,  9),
##D              c("sex",    10, 10),
##D              c("age",    11, 12),
##D              c("income", 13, 16))
##D 
##D fwf2csv("example.txt", "example.csv",
##D         names = tab[, 1],
##D         begin = as.numeric(tab[, 2]),
##D         end = as.numeric(tab[, 3]))
##D df <- read.table("example.csv", header = TRUE,
##D                  sep = "\t", quote = "")
## End(Not run)



