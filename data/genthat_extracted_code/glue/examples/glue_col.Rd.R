library(glue)


### Name: glue_col
### Title: Construct strings with color
### Aliases: glue_col glue_data_col

### ** Examples

if (require(crayon)) {
  glue_col("{blue foo bar}")

  glue_col("{blue 1 + 1 = {1 + 1}}")

  white_on_grey <- bgBlack $ white
  glue_col("{white_on_grey
    Roses are {red {colors()[[552]]}}
    Violets are {blue {colors()[[26]]}}
    `glue_col()` can show {red c}{yellow o}{green l}{cyan o}{blue r}{magenta s}
    and {bold bold} and {underline underline} too!
    }")
}



