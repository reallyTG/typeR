library(rggobi)


### Name: "rownames<-.GGobiData"
### Title: Set row names
### Aliases: rownames<-.GGobiData
### Keywords: attribute internal

### ** Examples

if (interactive()) {
g <- ggobi(mtcars)
df <- g[1]
rownames(df)
rownames(df) <- tolower(rownames(df))
rownames(df)}


