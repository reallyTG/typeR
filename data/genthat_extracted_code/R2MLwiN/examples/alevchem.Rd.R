library(R2MLwiN)


### Name: alevchem
### Title: Chemistry A-level results from one exam board
### Aliases: alevchem
### Keywords: datasets

### ** Examples

## Not run: 
##D 
##D data(alevchem, package = "R2MLwiN")
##D 
##D alevchem$gcseav <- double2singlePrecision(alevchem$gcse_tot/alevchem$gcse_no - 6)
##D 
##D # Note: Establishment codes on their own do not uniquely identify schools.
##D # Schools are instead uniquely identified by LEA code, establishment ID
##D # combination. Thus, here we generated a unique school ID.
##D 
##D alevchem$school <- as.numeric(factor(paste0(alevchem$lea, alevchem$estab)))
##D 
##D (mymodel <- runMLwiN(logit(a_point, cons, 6) ~ 1 + gcseav[1:5] + I(gcseav^2)[1:5] +
##D   gender[1:5] + (1[1:5] + gcseav[1:5] | school), 
##D   D = "Ordered Multinomial", estoptions = list(EstM = 1), data = alevchem))
##D 
## End(Not run)



