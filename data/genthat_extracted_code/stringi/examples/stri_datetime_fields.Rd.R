library(stringi)


### Name: stri_datetime_fields
### Title: Get Values for Date and Time Fields
### Aliases: stri_datetime_fields

### ** Examples

stri_datetime_fields(stri_datetime_now())
stri_datetime_fields(stri_datetime_now(), locale="@calendar=hebrew")
stri_datetime_symbols(locale="@calendar=hebrew")$Month[
   stri_datetime_fields(stri_datetime_now(), locale="@calendar=hebrew")$Month
]




