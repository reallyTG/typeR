library(arrayhelpers)


### Name: array2df
### Title: array2df
### Aliases: array2df
### Keywords: array manip

### ** Examples

a <- arrayhelpers:::a
a
array2df (a)
array2df (a, matrix = TRUE)

array2df (a, levels = list(NULL, x = NA, c = NULL), label.x = "value")

array2df (a, levels = list(NULL, x = TRUE, c = c ("foo", "bar")), label.x = "value")

summary (array2df (a,
                   levels = list(NULL, x = NA, c = c ("foo", "bar")),
                   label.x = "value"))

summary (array2df (a,
                   levels = list(NULL, x = NA, c = c ("foo", "bar")),
                   label.x = "value",
                   matrix = TRUE))




