library(lavaan)


### Name: mplus2lavaan.modelSyntax
### Title: Convert Mplus model syntax to lavaan
### Aliases: mplus2lavaan.modelSyntax

### ** Examples

## Not run: 
##D syntax <- '
##D     f1 BY x1*1 x2 x3;
##D     x1 WITH x2;
##D     x3 (1);
##D     x2 (1);
##D '
##D lavSyntax <- mplus2lavaan.modelSyntax(syntax)
##D cat(lavSyntax)
## End(Not run)



