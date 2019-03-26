library(dplyr)


### Name: src_local
### Title: A local source.
### Aliases: src_local src_df
### Keywords: internal

### ** Examples

if (require("Lahman")) {
batting_df <- tbl(src_df("Lahman"), "Batting")
}



