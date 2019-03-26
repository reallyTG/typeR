library(Rdpack)


### Name: parse_pairlist
### Title: Parse formal arguments of functions
### Aliases: parse_pairlist pairlist2f_usage1
### Keywords: RdoBuild

### ** Examples

parse_pairlist(formals(lm))
parse_pairlist(formals(system.file))
s_lm <- pairlist2f_usage1(formals(summary.lm), "summary", S3class = "lm")
s_lm
as.character(s_lm)



