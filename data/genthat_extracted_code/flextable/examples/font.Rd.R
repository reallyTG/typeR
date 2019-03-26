library(flextable)


### Name: font
### Title: Set font
### Aliases: font

### ** Examples

require("gdtools")
fontname <- "Times"

if( !font_family_exists(fontname) ){
  # if Times is not available, we will use the first available
  font_list <- sys_fonts()
  fontname <- as.character(font_list$family[1])
}

ft <- regulartable(head(iris))
ft <- font(ft, fontname = fontname, part = "header")



