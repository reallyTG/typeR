library(charlatan)


### Name: BaseProvider
### Title: BaseProvider
### Aliases: BaseProvider
### Keywords: internal

### ** Examples

(x <- BaseProvider$new())

x$numerify("#%%asdf221?")
x$lexify("#%%asdf221?")
x$bothify("#%%asdf221?")

z <- PhoneNumberProvider$new()
x$numerify(z$render())

x$random_element(letters)
x$random_int()
x$random_digit()
x$random_digit_not_zero()
x$random_digit_or_empty()
x$random_digit_not_zero_or_empty()
x$random_letter()
x$check_locale("es_ES")
## fails
# x$check_locale("es_EQ")

x$randomize_nb_elements()



