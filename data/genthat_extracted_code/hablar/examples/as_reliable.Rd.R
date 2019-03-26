library(hablar)


### Name: as_reliable
### Title: Reliable conversion to another data type
### Aliases: as_reliable as_reliable_num as_reliable_int as_reliable_lgl
###   as_reliable_dte as_reliable_dtm

### ** Examples

x <- as.factor(c("1", "3.5"))
as_reliable_num(x)

x <- as.factor(c("9", "7"))
as_reliable_int(x)

x <- as.factor(c("1", "0"))
as_reliable_lgl(x)




