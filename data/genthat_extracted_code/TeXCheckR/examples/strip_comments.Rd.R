library(TeXCheckR)


### Name: strip_comments
### Title: Strip comments from LaTeX lines
### Aliases: strip_comments

### ** Examples


some_lines <- c("Text. % A comment", "20% of comments are % useful")
strip_comments(some_lines)
strip_comments(some_lines, retain.percent.symbol = FALSE)



