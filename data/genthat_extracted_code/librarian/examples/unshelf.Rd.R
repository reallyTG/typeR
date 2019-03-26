library(librarian)


### Name: unshelf
### Title: Detach (unload) packages from the search path
### Aliases: unshelf

### ** Examples

## No test: 
# These are the same:

unshelf(janitor, desiderata, purrr)
unshelf(janitor, DesiQuintans/desiderata, purrr)

# unshelf() returns invisibly; bind its output to a variable or access the .Last.value.

print(.Last.value)

#> desiderata    janitor      purrr 
#>       TRUE       TRUE       TRUE 

unshelf(everything = TRUE)
print(.Last.value)

#> librarian testthat
#> TRUE      TRUE
## End(No test)




