library(imptree)


### Name: imptree_params
### Title: Method parameters for generating imptree objects
### Aliases: imptree_params
### Keywords: internal

### ** Examples

## Note: 
## The function is used internally by imptree (not exported).

## default constructed for method IDM
imptree:::imptree_params(NULL, method = "IDM")

## passing arguments as list ('s' is not required for 'NPI')
imptree:::imptree_params(args = list(correction = "strobl", 
                                     splitmetric = "globalmax"),
                         method = "NPI")




