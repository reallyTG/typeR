library(alakazam)


### Name: checkColumns
### Title: Check data.frame for valid columns and issue message if invalid
### Aliases: checkColumns

### ** Examples

df <- data.frame(A=1:3, B=4:6, C=rep(NA, 3))
checkColumns(df, c("A", "B"), logic="all")
checkColumns(df, c("A", "B"), logic="any")
checkColumns(df, c("A", "C"), logic="all")
checkColumns(df, c("A", "C"), logic="any")
checkColumns(df, c("A", "D"), logic="all")
checkColumns(df, c("A", "D"), logic="any")




