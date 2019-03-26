library(salty)


### Name: salt_swap
### Title: Randomly swap out entire values in a vector
### Aliases: salt_swap

### ** Examples

x <- c("Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
       "Nunc finibus tortor a elit eleifend interdum.",
       "Maecenas aliquam augue sit amet ultricies placerat.")

new_values <- c("foo", "bar", "baz")

salt_swap(x, swaps = new_values, p = 0.5)



