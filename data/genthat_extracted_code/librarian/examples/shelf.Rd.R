library(librarian)


### Name: shelf
### Title: Attach packages to the search path, installing them from CRAN or
###   GitHub if needed
### Aliases: shelf

### ** Examples

## No test: 
shelf(fortunes, DesiQuintans/emptyRpackage, cowsay, lib = tempdir(), update_all = TRUE)

# shelf() returns invisibly; bind its output to a variable or access the .Last.value.

print(.Last.value)

#> fortunes desiderata     cowsay 
#>     TRUE       TRUE       TRUE
## End(No test)




