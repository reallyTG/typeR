library(poio)


### Name: language_codes
### Title: Language codes supported by GNU gettext
### Aliases: ALLOWED_LANGUAGE_REGEX language_codes
### Keywords: datasets

### ** Examples

# The dataset contains:
e <- new.env()
utils::data(language_codes, package = "poio", envir = e)
e$language_codes

# Allowed values in the language field can be matched like this
# (though it will be automatically done in generate_po_from_pot)
stringi::stri_detect_regex(c("it", "nl_BE", "xxx"), ALLOWED_LANGUAGE_REGEX)



