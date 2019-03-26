library(prefmod)


### Name: cemspc
### Title: Data (paired comparisons with undecided): CEMS (Community of
###   European management schools)
### Aliases: cemspc
### Keywords: datasets

### ** Examples

old_par <- par(mfrow = c(4, 4))
for(i in 1:15){ barplot(table(cemspc[, i])) }
par(old_par)



