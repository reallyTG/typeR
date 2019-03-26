library(rebus.unicode)


### Name: ugc_cased_letter
### Title: Unicode General Categories
### Aliases: UGC_CASED_LETTER UGC_CLOSE_PUNCTUATION
###   UGC_CONNECTOR_PUNCTUATION UGC_CONTROL UGC_CURRENCY_SYMBOL
###   UGC_DASH_PUNCTUATION UGC_DECIMAL_NUMBER UGC_ENCLOSING_MARK
###   UGC_FINAL_PUNCTUATION UGC_FORMAT_CONTROL UGC_INITIAL_PUNCTUATION
###   UGC_LETTER UGC_LETTER_NUMBER UGC_LINE_SEPARATOR UGC_LOWERCASE_LETTER
###   UGC_MARK UGC_MATH_SYMBOL UGC_MODIFIER_LETTER UGC_MODIFIER_SYMBOL
###   UGC_NONSPACING_MARK UGC_NUMBER UGC_OPEN_PUNCTUATION UGC_OTHER
###   UGC_OTHER_LETTER UGC_OTHER_NUMBER UGC_OTHER_PUNCTUATION
###   UGC_OTHER_SYMBOL UGC_PARAGRAPH_SEPARATOR UGC_PRIVATE_USE_CONTROL
###   UGC_PUNCTUATION UGC_SEPARATOR UGC_SPACE_SEPARATOR UGC_SPACING_MARK
###   UGC_SURROGATE_CONTROL UGC_SYMBOL UGC_TITLECASE_LETTER
###   UGC_UNASSIGNED_CONTROL UGC_UPPERCASE_LETTER UnicodeGeneralCategory
###   ugc_cased_letter ugc_close_punctuation ugc_connector_punctuation
###   ugc_control ugc_currency_symbol ugc_dash_punctuation
###   ugc_decimal_number ugc_enclosing_mark ugc_final_punctuation
###   ugc_format_control ugc_initial_punctuation ugc_letter
###   ugc_letter_number ugc_line_separator ugc_lowercase_letter ugc_mark
###   ugc_math_symbol ugc_modifier_letter ugc_modifier_symbol
###   ugc_nonspacing_mark ugc_number ugc_open_punctuation ugc_other
###   ugc_other_letter ugc_other_number ugc_other_punctuation
###   ugc_other_symbol ugc_paragraph_separator ugc_private_use_control
###   ugc_punctuation ugc_separator ugc_space_separator ugc_spacing_mark
###   ugc_surrogate_control ugc_symbol ugc_titlecase_letter
###   ugc_unassigned_control ugc_uppercase_letter unicode_general_category
### Keywords: datasets

### ** Examples

# Classes
ugc_lowercase_letter()
ugc_decimal_number()
ugc_paragraph_separator()
ugc_currency_symbol()

# With repetition
ugc_nonspacing_mark(3, 6)
ugc_separator(1, Inf)
ugc_dash_punctuation(0, Inf)

# Without a class wrapper
ugc_titlecase_letter(char_class = FALSE)

# Constants
UGC_UPPERCASE_LETTER
UGC_LETTER_NUMBER
UGC_MATH_SYMBOL
UGC_FORMAT_CONTROL

## Not run: 
##D # All the Unicode general categories.
##D # Not run, since it generates lots of output
##D ls("package:rebus.unicode", pattern = "^ugc")
## End(Not run)

# Usage
library(rebus.base)
x <- "I exchanged $1000 for \u20ac665.41 and \u00a3243.13."
(rx <- capture(ugc_currency_symbol()) %R% 
  capture(
    ugc_decimal_number(1, Inf) %R%
    optional(group("." %R% ugc_decimal_number(2)))
  )
)
stringi::stri_match_all_regex(x, rx)



