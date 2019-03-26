library(brms)


### Name: update_adterms
### Title: Update Formula Addition Terms
### Aliases: update_adterms

### ** Examples

form <- y | trials(size) ~ x
update_adterms(form, ~ trials(10))
update_adterms(form, ~ weights(w))
update_adterms(form, ~ weights(w), action = "replace")
update_adterms(y ~ x, ~ trials(10))




