library(xltabr)


### Name: style_catalogue_add_openxlsx_style
### Title: Manually add an openxlsx s4 style the style catalogue
### Aliases: style_catalogue_add_openxlsx_style

### ** Examples

tab <- xltabr::initialise()
s4style <- openxlsx::createStyle(fontName = "Courier",
                                 fontColour = "#80a9ed",
                                 fontSize = 20,
                                 numFmt =  "£    #,###")
tab <- style_catalogue_add_openxlsx_style(tab, "custom", s4style, row_height = 40)



