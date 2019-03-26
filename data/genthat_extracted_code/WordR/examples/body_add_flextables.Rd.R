library(WordR)


### Name: body_add_flextables
### Title: Read Word document with bookmarks and create other Word document
###   with rendered tables in place.
### Aliases: body_add_flextables

### ** Examples

library(flextable)
ft_mtcars <- flextable(mtcars)
ft_iris <- flextable(iris)
FT <- list(ft_mtcars=ft_mtcars,ft_iris=ft_iris)
body_add_flextables(
   paste(examplePath(),'templates/templateFT.docx',sep = ''),
   paste(tempdir(),'/resultFT.docx',sep = ''),
   FT)



