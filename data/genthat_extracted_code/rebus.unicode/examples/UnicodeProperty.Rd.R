library(rebus.unicode)


### Name: up_alphabetic
### Title: Unicode Properties
### Aliases: UP_ALPHABETIC UP_ASCII_HEX_DIGIT UP_BIDI_CONTROL
###   UP_BIDI_MIRRORED UP_CASED UP_CASE_IGNORABLE UP_CASE_SENSITIVE
###   UP_CHANGES_WHEN_CASEFOLDED UP_CHANGES_WHEN_CASEMAPPED
###   UP_CHANGES_WHEN_LOWERCASED UP_CHANGES_WHEN_NFKC_CASEFOLDED
###   UP_CHANGES_WHEN_TITLECASED UP_CHANGES_WHEN_UPPERCASED UP_DASH
###   UP_DEFAULT_IGNORABLE_CODE_POINT UP_DEPRECATED UP_DIACRITIC
###   UP_EXTENDER UP_HEX_DIGIT UP_HYPHEN UP_IDEOGRAPHIC UP_ID_CONTINUE
###   UP_ID_START UP_LOWERCASE UP_MATH UP_NONCHARACTER_CODE_POINT
###   UP_POSIX_ALNUM UP_POSIX_BLANK UP_POSIX_GRAPH UP_POSIX_PRINT
###   UP_POSIX_XDIGIT UP_QUOTATION_MARK UP_SOFT_DOTTED
###   UP_TERMINAL_PUNCTUATION UP_UPPERCASE UP_WHITE_SPACE UnicodeProperty
###   unicode_property up_alphabetic up_ascii_hex_digit up_bidi_control
###   up_bidi_mirrored up_case_ignorable up_case_sensitive up_cased
###   up_changes_when_casefolded up_changes_when_casemapped
###   up_changes_when_lowercased up_changes_when_nfkc_casefolded
###   up_changes_when_titlecased up_changes_when_uppercased up_dash
###   up_default_ignorable_code_point up_deprecated up_diacritic
###   up_extender up_hex_digit up_hyphen up_id_continue up_id_start
###   up_ideographic up_lowercase up_math up_noncharacter_code_point
###   up_posix_alnum up_posix_blank up_posix_graph up_posix_print
###   up_posix_xdigit up_quotation_mark up_soft_dotted
###   up_terminal_punctuation up_uppercase up_white_space
### Keywords: datasets

### ** Examples

# Classes
up_math()
up_posix_alnum()
up_changes_when_uppercased()
up_diacritic()

# With repetition
ugc_nonspacing_mark(3, 6)
up_quotation_mark(1, Inf)
up_posix_xdigit(0, Inf)

# Without a class wrapper
up_hyphen(char_class = FALSE)

# Constants
UP_ALPHABETIC
UP_DASH
UP_POSIX_ALNUM
UP_CHANGES_WHEN_LOWERCASED

## Not run: 
##D # All the Unicode properties.
##D # Not run, since it generates lots of output
##D ls("package:rebus.unicode", pattern = "^up")
## End(Not run)

# Usage
# Hello in Samoan, Serbian, Persian, Simplified Chinese
hello <- "t\u101lofa, \u437\u434\u440\u430\u432\u43e, \u633\u644\u627\u645, \u4f60\u597d"
stringi::stri_extract_all_regex(hello, up_alphabetic(1, Inf))
stringi::stri_extract_all_regex(hello, up_case_sensitive(1, Inf))



