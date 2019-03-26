library(EcoGenetics)


### Name: eco.formula
### Title: Formula construction for ecogen objects
### Aliases: eco.formula

### ** Examples

## Not run: 
##D require(vegan)
##D data(eco.test)
##D 
##D # Note that in this example "Condition" is not replaced; 
##D # the function Condition has a special meaning in rda,
##D # indicating conditioning variables; in eco.formula it is only text.
##D 
##D form <- eco.formula(eco, P1 + P2 + P3 + U(A) ~ E1 + E2 + Condition(X+Y))
##D rda(form)
##D 
##D form2 <- eco.formula(eco, P1 + P2 + P3 + U(A) ~ E1 + E2 + X + Y)
##D lm(form2)
##D 
##D 
##D # parsing with magrittr
##D eco.formula(eco, P1 + P2 + P3 + U(A) ~ U(E) + Condition(X+Y)) %>% rda
## End(Not run)




