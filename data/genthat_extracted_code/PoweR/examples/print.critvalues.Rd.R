library(PoweR)


### Name: print.critvalues
### Title: Latex table for critical values
### Aliases: print.critvalues print.critvalues1
### Keywords: print

### ** Examples

## Regenerate Table 1 from Puig (2000) (page 419)
# Take M = 10000 for accurate results
M <- 10
law.index <- 1
vectn <- c(10,15,20,35,50,75,100,1000)
level <- c(0.50,0.25,0.10,0.05,0.025,0.01) 
table1 <- many.crit(law.index,stat.indices = c(43),M,vectn,level,
                    alter = list(stat43=3),law.pars = NULL,parstat = NULL)
print.critvalues(table1,digits=3,latex.output=TRUE)



