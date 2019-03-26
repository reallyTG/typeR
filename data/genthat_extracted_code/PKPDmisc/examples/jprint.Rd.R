library(PKPDmisc)


### Name: jprint
### Title: print multiple values joined together
### Aliases: jprint

### ** Examples

result <- "world"
jprint("hello", result)

missing_cols <- c("WT", "HT", "OCC") #would normally actually calculate this
jprint("missing columns: ", missing_cols)
jprint("missing columns: ", missing_cols, sep_vector=";")
jprint("missing cols", missing_cols, sep_atomic=":")



