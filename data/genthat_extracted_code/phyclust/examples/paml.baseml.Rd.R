library(phyclust)


### Name: paml.baseml
### Title: Phylogenetic Analysis by Maximum Likelihood for Nucleotide
###   Sequences
### Aliases: paml.baseml paml.baseml.control paml.baseml.show.default
###   'Class baseml'
### Keywords: PAML

### ** Examples

## Not run: 
##D library(phyclust, quiet = TRUE)
##D 
##D paml.baseml.show.default()
##D 
##D ### Generate data.
##D set.seed(123)
##D ret.ms <- ms(nsam = 5, nreps = 1, opts = "-T")
##D ret.seqgen <- seqgen(opts = "-mHKY -l40 -s0.2", newick.tree = ret.ms[3])
##D (ret.nucleotide <- read.seqgen(ret.seqgen))
##D X <- ret.nucleotide$org
##D seqname <- ret.nucleotide$seqname
##D 
##D ### Run baseml.
##D opts <- paml.baseml.control(model = 4, clock = 1)
##D (ret.baseml <- paml.baseml(X, seqname = seqname, opts = opts))
##D (ret.baseml.init <- paml.baseml(X, seqname = seqname, opts = opts,
##D    newick.trees = ret.ms[3]))
##D ret.ms[3]
##D 
##D ### Unrooted tree.
##D opts <- paml.baseml.control(model = 4)
##D (ret.baseml.unrooted <- paml.baseml(X, seqname = seqname, opts = opts))
##D 
##D ### More information.
##D opts <- paml.baseml.control(noisy = 3, verbose = 1, model = 4, clock = 1)
##D ret.more <- paml.baseml(X, seqname = seqname, opts = opts)
##D # ret.more$stdout
##D 
##D ### Plot trees
##D par(mfrow = c(2, 2))
##D plot(read.tree(text = ret.ms[3]), main = "true")
##D plot(read.tree(text = ret.baseml$best.tree), main = "baseml")
##D plot(read.tree(text = ret.baseml.init$best.tree), main = "baseml with initial")
##D plot(unroot(read.tree(text = ret.baseml.unrooted$best.tree)),
##D      main = "baseml unrooted")
## End(Not run)



