library(evtree)


### Name: ContraceptiveChoice
### Title: Contraceptive Method Choice
### Aliases: ContraceptiveChoice
### Keywords: datasets

### ** Examples

data("ContraceptiveChoice")
summary(ContraceptiveChoice)
## Not run: 
##D set.seed(1090)
##D contt <- evtree(contraceptive_method_used ~ . , data = ContraceptiveChoice) 
##D contt
##D table(predict(contt), ContraceptiveChoice$contraceptive_method_used)
##D plot(contt)
## End(Not run)



