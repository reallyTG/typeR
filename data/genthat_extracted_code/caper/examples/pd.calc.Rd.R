library(caper)


### Name: pd.calc
### Title: Calculate and bootstrap phylogenetic diversity measurements.
### Aliases: pd.calc pd.bootstrap ed.calc
### Keywords: utilities

### ** Examples

treeString <- paste('((((A:1,B:1):1.5,C:2.5):0.5,(D:0.6,E:0.6):2.4):0.5,',
                    '((F:1.9,G:1.9):0.8,(H:1.6,I:1.6):1.1):0.8):0.2;' ,sep='')
tre <- read.tree(text=treeString)
clmat <- clade.matrix(tre)
tips <- c("A","C","D","E","G","H")
pd.calc(clmat, tip.subset=tips)
pd.calc(clmat, tip.subset=c(1,3,4,5,7,8))
pd.calc(clmat, tip.subset=tips, root.edge=TRUE)

pd.bootstrap(clmat, ntips=6, reps=1000, method='TBL')

data(IsaacEtAl)
primatesCM <- clade.matrix(primates.tree)
primatesED <- ed.calc(primatesCM)



