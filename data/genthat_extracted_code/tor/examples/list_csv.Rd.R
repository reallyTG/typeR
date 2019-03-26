library(tor)


### Name: list_csv
### Title: Read multiple files from a directory into a list.
### Aliases: list_csv list_tsv list_rds list_rdata

### ** Examples

(rds <- tor_example("rds"))
dir(rds)

list_rds(rds)

(tsv <- tor_example("tsv"))
dir(tsv)

list_tsv(tsv)

(mixed <- tor_example("mixed"))
dir(mixed)

list_rdata(mixed)

list_csv(mixed)

list_rdata(mixed, regexp = "[.]RData", ignore.case = FALSE)



