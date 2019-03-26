library(EffectStars)


### Name: BEPS
### Title: British Election Panel Study
### Aliases: BEPS
### Keywords: datasets multinomial response

### ** Examples

## Not run: 
##D data(BEPS)
##D 
##D BEPS$Europe<-scale(BEPS$Europe)
##D BEPS$Age<-scale(BEPS$Age)
##D BEPS$Leader_Labour<-BEPS$Leader_Labour-BEPS$Leader_Cons
##D BEPS$Leader<-BEPS$Leader_Labour
##D BEPS$Leader_Liberals<-BEPS$Leader_Liberals-BEPS$Leader_Cons
##D 
##D star.nominal(Vote ~ Age + Household + National_Economy + Household + Leader + 
##D Europe + Political_Knowledge + Gender, data = BEPS, 
##D xij = list(Leader~Leader_Labour+Leader_Liberals), catstar = FALSE, symmetric = FALSE)
## End(Not run)



