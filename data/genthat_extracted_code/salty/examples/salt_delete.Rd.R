library(salty)


### Name: salt_delete
### Title: Delete some characters from some values
### Aliases: salt_delete

### ** Examples

x <- c("Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
       "Nunc finibus tortor a elit eleifend interdum.",
       "Maecenas aliquam augue sit amet ultricies placerat.")

salt_delete(x, p = 0.5, n = 5)

salt_empty(x, p = 0.5)

salt_na(x, p = 0.5)



