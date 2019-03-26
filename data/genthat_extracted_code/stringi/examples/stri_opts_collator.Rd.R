library(stringi)


### Name: stri_opts_collator
### Title: Generate a List with Collator Settings
### Aliases: stri_opts_collator

### ** Examples

stri_cmp("number100", "number2")
stri_cmp("number100", "number2", opts_collator=stri_opts_collator(numeric=TRUE))
stri_cmp("number100", "number2", numeric=TRUE) # equivalent
stri_cmp("above mentioned", "above-mentioned")
stri_cmp("above mentioned", "above-mentioned", alternate_shifted=TRUE)



