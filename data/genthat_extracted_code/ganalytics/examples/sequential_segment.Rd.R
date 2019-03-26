library(ganalytics)


### Name: sequential_segment
### Title: sequential_segment.
### Aliases: sequential_segment

### ** Examples

a <- Expr(~pagePath == "/home")
b <- Expr(~eventCategory == "Video") &
  Expr(~eventAction == "Play")
c <- Expr(~medium == "email")
s <- sequential_segment(list( ..., a, ..., b, c ))




