library(ElstonStewart)


### Name: Likelihood
### Title: Compute the log-likelihood of a parameter
### Aliases: Likelihood

### ** Examples

data(fams)

# this data frame contains various families
# getting their famid
fam.ids <- unique(fams$fam);

# creating a list of genotypes corresponding to all individuals in fams
# NA -> 0, 1 or 2
genotypes <- lapply( fams$genotype, function(x) if(is.na(x)) 0:2 else x )

# creating a list of es.pedigree objects
X <- vector("list", length(fam.ids))
for(i in seq_along(fam.ids))
{
  w <- which(fams$fam == fam.ids[i])
  X[[i]] <- es.pedigree( id = fams$id[w], father = fams$father[w],
      mother = fams$mother[w], sex = fams$sex[w], pheno = rep(0, length(w)), 
      geno = genotypes[w], famid = fam.ids[i] )
}

## Not run: 
##D # computing the likelihood for a single value p
##D Likelihood(X, modele.di, theta = list( p=0.5), n.cores=1 )
##D 
##D # computing the likelihood for a vector p (Elston-Stewart is ran only once!)
##D p <- seq(0,1,length=501)
##D L <- Likelihood(X, modele.di, theta = list( p=p ), n.cores=1 ) 
##D plot( p, exp(L), type="l")
##D 
##D # running an optimization algorithm
##D # Elston-Stewart is ran several times
##D # here we run the algorithm with 2 cores
##D L <- function(p) -Likelihood(X, modele.di, theta = list( p=p ), n.cores=2 ) 
##D optimize(L , c(0.35,0.45) )
## End(Not run)



