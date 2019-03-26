library(jjb)


### Name: convert_cols
### Title: Convert Multiple Columns of a 'data.frame' All at once
###   conversion of a 'data.frame' from current column types to alternates.
### Aliases: convert_cols

### ** Examples


n = 100

st = sample(LETTERS, n, replace = TRUE)
sr = sample(letters, n, replace = TRUE)
num = rnorm(n)

d = data.frame(x = st, y = num, z = sr, stringsAsFactors = FALSE)

# Convert all columns

o = convert_cols(d,c("f", "c", "f"))

# Convert a subset
d[, c(1, 3)] = convert_cols(d[, c(1, 3)], c("f", "f"))



