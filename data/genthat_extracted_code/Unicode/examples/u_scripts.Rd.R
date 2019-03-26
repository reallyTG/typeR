library(Unicode)


### Name: u_scripts
### Title: Unicode Scripts
### Aliases: u_scripts

### ** Examples

scripts <- u_scripts()
names(scripts)
## Total number of code points assigned to the scripts:
sort(sapply(scripts, function(s) sum(n_of_u_chars(s))),
     decreasing = TRUE)



