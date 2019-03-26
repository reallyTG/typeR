library(stringi)


### Name: stri_datetime_create
### Title: Create a Date-Time Object
### Aliases: stri_datetime_create

### ** Examples

stri_datetime_create(2015, 12, 31, 23, 59, 59.999)
stri_datetime_create(5775, 8, 1, locale="@calendar=hebrew") # 1 Nisan 5775 -> 2015-03-21
stri_datetime_create(2015, 02, 29)
stri_datetime_create(2015, 02, 29, lenient=TRUE)




