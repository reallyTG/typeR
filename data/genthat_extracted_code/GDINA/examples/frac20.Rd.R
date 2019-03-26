library(GDINA)


### Name: frac20
### Title: Tatsuoka's fraction subtraction data
### Aliases: frac20
### Keywords: datasets

### ** Examples

## Not run: 
##D mod1 <- GDINA(frac20$dat,frac20$Q,model="DINA")
##D mod1
##D summary(mod1)
##D # Higher order model
##D mod2 <- GDINA(frac20$dat,frac20$Q,model="DINA",att.dist="higher.order")
##D mod2
##D anova(mod1,mod2)
## End(Not run)



