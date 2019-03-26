library(envlpaster)


### Name: selection
### Title: selection
### Aliases: selection

### ** Examples

## Not run: 
##D   set.seed(13)
##D   library(envlpaster)
##D   library(aster2)
##D   data(generateddata)
##D   m.null <- aster(resp ~ 0 + varb, fam = fam, pred = pred, 
##D     varvar = varb, idvar = id, root = root, data = redata)
##D   m1 <- aster(resp ~ 0 + varb + mass + timing, 
##D     fam = fam, pred = pred, varvar = varb, idvar = id,
##D     root = root, data = redata)
##D   m2 <- aster(resp ~ 0 + varb + mass + timing + 
##D     I(mass^2) + I(timing^2) + I(mass*timing), 
##D     fam = fam, pred = pred, varvar = varb, idvar = id,
##D     root = root, data = redata)
##D   anova.table <- anova(m.null,m1,m2); anova.table
##D   beta <- m1$coef
##D   a <- grepl( "offsp", names(beta)) 
##D   a <- a + grepl( "surviv", names(beta)) 
##D   b <- which(a == 1)
##D   target <- c(1:length(beta))[-b]
##D   nnode <- ncol(m1$x)
##D   data.aster <- asterdata(data, vars, pred, rep(0,nnode),
##D     fam, families = list("bernoulli", "poisson", 
##D     fam.zero.truncated.poisson()))
##D   selection(parm  = beta, index = target, model = m1, 
##D     data = data.aster, alpha = 0.05, type = "canonical", 
##D     method = "eigen")
##D   
## End(Not run)



