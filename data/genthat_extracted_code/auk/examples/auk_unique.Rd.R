library(auk)


### Name: auk_unique
### Title: Remove duplicate group checklists
### Aliases: auk_unique

### ** Examples

# read in an ebd file and don't automatically remove duplicates
f <- system.file("extdata/ebd-sample.txt", package = "auk")
ebd <- read_ebd(f, unique = FALSE)
# remove duplicates
ebd_unique <- auk_unique(ebd)
nrow(ebd)
nrow(ebd_unique)



