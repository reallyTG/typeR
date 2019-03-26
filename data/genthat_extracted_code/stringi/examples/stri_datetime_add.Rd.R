library(stringi)


### Name: stri_datetime_add
### Title: Date and Time Arithmetic
### Aliases: stri_datetime_add stri_datetime_add<-

### ** Examples

x <- stri_datetime_now()
stri_datetime_add(x, units="months") <- 2
print(x)
stri_datetime_add(x, -2, units="months")
stri_datetime_add(stri_datetime_create(2014, 4, 20), 1, units="years")
stri_datetime_add(stri_datetime_create(2014, 4, 20), 1, units="years", locale="@calendar=hebrew")

stri_datetime_add(stri_datetime_create(2016, 1, 31), 1, units="months")




