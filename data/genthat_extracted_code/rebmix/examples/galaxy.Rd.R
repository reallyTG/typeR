library(rebmix)


### Name: galaxy
### Title: Galaxy Dataset
### Aliases: galaxy
### Keywords: datasets

### ** Examples

data("galaxy")

colnames(galaxy)

# Write dataset into tab delimited ASCII file.

write.table(galaxy, file = "galaxy.txt", sep = "\t",
  eol = "\n", row.names = FALSE, col.names = FALSE)

# Write dataset into rda file.

save(galaxy, file = "galaxy.rda")



