library(openxlsx)


### Name: writeComment
### Title: write a cell comment
### Aliases: writeComment

### ** Examples

wb <- createWorkbook()
addWorksheet(wb, "Sheet 1")

c1 <- createComment(comment = "this is comment")
writeComment(wb, 1, col = "B", row = 10, comment = c1)

s1 <- createStyle(fontSize = 12, fontColour = "red", textDecoration = c("BOLD"))
s2 <- createStyle(fontSize = 9, fontColour = "black")

c2 <- createComment(comment = c("This Part Bold red\n\n", "This part black"), style = c(s1, s2))
c2

writeComment(wb, 1, col = 6 , row = 3, comment = c2)

saveWorkbook(wb, file = "writeCommentExample.xlsx", overwrite = TRUE)



