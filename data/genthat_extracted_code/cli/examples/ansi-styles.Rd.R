library(cli)


### Name: ansi-styles
### Title: ANSI colored text
### Aliases: ansi-styles bg_black bg_blue bg_cyan bg_green bg_magenta
###   bg_red bg_white bg_yellow col_black col_blue col_cyan col_green
###   col_magenta col_red col_white col_yellow col_grey col_silver
###   style_dim style_blurred style_bold style_hidden style_inverse
###   style_italic style_reset style_strikethrough style_underline

### ** Examples

col_blue("Hello ", "world!")
cat(col_blue("Hello ", "world!"))

cat("... to highlight the", col_red("search term"),
    "in a block of text\n")

## Style stack properly
cat(col_green(
 "I am a green line ",
 col_blue(style_underline(style_bold("with a blue substring"))),
 " that becomes green again!"
))

error <- combine_ansi_styles("red", "bold")
warn <- combine_ansi_styles("magenta", "underline")
note <- col_cyan
cat(error("Error: subscript out of bounds!\n"))
cat(warn("Warning: shorter argument was recycled.\n"))
cat(note("Note: no such directory.\n"))




