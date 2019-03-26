library(charlatan)


### Name: CompanyProvider
### Title: CompanyProvider
### Aliases: CompanyProvider company_provider_locales
### Keywords: datasets internal

### ** Examples

x <- CompanyProvider$new()
x$locale
x$company()
x$company_suffix()
x$catch_phrase()
x$bs()

x <- CompanyProvider$new(locale = "fr_FR")
x$locale
x$company()
x$company_suffix()
x$siren()

x <- CompanyProvider$new(locale = "hr_HR")
x$locale
x$company()
x$company_suffix()

x <- CompanyProvider$new(locale = "it_IT")
x$locale
x$company()
x$company_suffix()
x$bs()

CompanyProvider$new(locale = "es_MX")$bs()
CompanyProvider$new(locale = "es_MX")$company_prefix()
CompanyProvider$new(locale = "es_MX")$catch_phrase()

CompanyProvider$new(locale = "bg_BG")$company()
CompanyProvider$new(locale = "cs_CZ")$company()
CompanyProvider$new(locale = "de_DE")$company()
CompanyProvider$new(locale = "fa_IR")$company()



