library(xltabr)


### Name: add_footer
### Title: Add footers to the tab.  Footer text is provided as a character
###   vector, with each element being a row of the footer
### Aliases: add_footer

### ** Examples

tab <- initialise()
footer_text <- c("Footer contents 1", "Footer contents 2")
footer_style_names <- c("subtitle", "subtitle")
tab <- add_footer(tab, footer_text, footer_style_names)
tab <- write_data_and_styles_to_wb(tab)



