library(charlatan)


### Name: PersonProvider
### Title: PersonProvider
### Aliases: PersonProvider person_provider_locales
### Keywords: datasets internal

### ** Examples

x <- PersonProvider$new()
x$locale
x$render()
x$first_name()
x$first_name_female()
x$first_name_male()
x$last_name()
x$last_name_female()
x$last_name_male()

x <- PersonProvider$new(locale = "en_GB")
x$locale
x$render()
x$first_name()
x$first_name_female()
x$first_name_male()
x$last_name()
x$last_name_female()
x$last_name_male()

z <- PersonProvider$new(locale = "fr_FR")
z$locale
z$render()
z$first_name()
z$first_name_female()
z$first_name_male()
z$last_name()
z$last_name_female()
z$last_name_male()
z$prefix()

z <- PersonProvider$new(locale = "de_AT")
z$locale
z$render()
z$first_name()
z$last_name()
z$prefix()

z <- PersonProvider$new(locale = "cs_CZ")
z$locale
z$render()
z$first_name()
z$first_name_female()
z$first_name_male()
z$last_name()
z$last_name_female()
z$last_name_male()
z$prefix()

z <- PersonProvider$new(locale = "es_MX")
z$locale
z$render()
z$first_name()
z$first_name_female()
z$first_name_male()
z$last_name()
z$prefix()

PersonProvider$new(locale = "fr_CH")$render()
PersonProvider$new(locale = "fi_FI")$render()
PersonProvider$new(locale = "fa_IR")$render()
PersonProvider$new(locale = "es_ES")$render()
PersonProvider$new(locale = "de_DE")$render()
PersonProvider$new(locale = "de_AT")$render()
PersonProvider$new(locale = "cs_CZ")$render()
PersonProvider$new(locale = "bg_BG")$render()
PersonProvider$new(locale = "da_DK")$render()



