library(freetypeharfbuzz)


### Name: font_info
### Title: Font metrics
### Aliases: font_info str_info str_width

### ** Examples

file <- fontquiver::font("Liberation", "serif", "bold")$ttf
font_info(font_size = 13, font_file = file)

str_width("foobar", font_size = 13)
str_info("foobar", font_size = 13)
str_info("foobar", font_size = 13, font_file = file)



