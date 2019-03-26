library(charlatan)


### Name: InternetProvider
### Title: InternetProvider
### Aliases: InternetProvider internet_provider_locales
### Keywords: datasets internal

### ** Examples

(x <- InternetProvider$new())
x$locale

# uri/url/tld/etc.
x$tld()
x$domain_word()
x$domain_name()
x$domain_name(levels = 2)
x$domain_name(levels = 3)
x$domain_name(levels = 10)
## url's
x$url()
x$url(schemes = c('hbbp', 'hggp'))
x$image_url()
## uri's
x$uri()
x$uri_page()
x$uri_extension()
x$uri_path()
x$uri_path(deep = 1)
x$uri_path(deep = 2)
x$uri_path(deep = 3)
x$uri_path(deep = 4)

# user name
x$user_name()

# emails
x$email()
x$safe_email()
x$free_email()
x$company_email()
x$free_email_domain()
x$ascii_email()
x$ascii_safe_email()
x$ascii_free_email()
x$ascii_company_email()

# addresses, mac, ipv4
x$mac_address()
if (requireNamespace("iptools", quietly=TRUE)) {
  x$ipv4()
}

# different locales
(x <- InternetProvider$new(locale = "en_AU"))
x$locale
x$tld()
x$email()
x$free_email_domain()

(x <- InternetProvider$new(locale = "de_DE"))
x$locale
x$tld()
x$uri()
x$email()
x$ascii_email()

(x <- InternetProvider$new(locale = "bg_BG"))
x$locale
x$tld()
x$uri()
x$url()
x$user_name()
x$email()
x$ascii_email()

(x <- InternetProvider$new(locale = "cs_CZ"))
x$url()
x$user_name()
x$email()

(x <- InternetProvider$new(locale = "fa_IR"))
x$url()

(x <- InternetProvider$new(locale = "fr_FR"))
x$url()
x$user_name()
x$email()

(x <- InternetProvider$new(locale = "hr_HR"))
x$url()
x$user_name()
x$email()

# convert a string to ascii with stringi pkg
if (requireNamespace("stringi", quietly=TRUE)) {
  x$to_ascii("anï")
}



