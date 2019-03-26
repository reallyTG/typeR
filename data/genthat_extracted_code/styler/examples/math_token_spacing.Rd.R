library(styler)


### Name: math_token_spacing
### Title: Specify spacing around math tokens
### Aliases: math_token_spacing specify_math_token_spacing
###   tidyverse_math_token_spacing

### ** Examples

style_text(
  "1+1   -3",
  math_token_spacing = specify_math_token_spacing(zero = "'+'"),
  strict = FALSE
)
style_text(
  "1+1   -3",
  math_token_spacing = specify_math_token_spacing(zero = "'+'"),
  strict = TRUE
)
style_text(
  "1+1   -3",
  math_token_spacing = tidyverse_math_token_spacing(),
  strict = FALSE
)
style_text(
  "1+1   -3",
  math_token_spacing = tidyverse_math_token_spacing(),
  strict = TRUE
)



