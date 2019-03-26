library(Bergm)


### Name: missBergm
### Title: Parameter estimation for Bayesian ERGMs under missing data
### Aliases: missBergm

### ** Examples

## Not run: 
##D # Load the florentine marriage network
##D data(florentine)
##D 
##D 
##D # Create missing data
##D set.seed(22101992)
##D 
##D missNode <- sample(1:16,1)
##D flomarriage[missNode,] <- NA
##D flomarriage[,missNode] <- NA
##D 
##D 
##D # Posterior parameter estimation:
##D m.flo <- missBergm(flomarriage ~ edges + kstar(2),
##D                burn.in = 50,
##D                aux.iters = 500,
##D                main.iters = 500,
##D                gamma = 1,
##D                nImp = 5)
##D 
##D # Posterior summaries:
##D 
##D bergm.output(m.flo)
##D 
##D # Bayesian goodness-of-fit test:
##D 
##D bgof(m.flo,
##D      aux.iters = 500,
##D      sample.size = 50,
##D      n.deg = 10,
##D      n.dist = 9,
##D      n.esp = 6)
## End(Not run)



