## ----load_package, results="hide", message=FALSE, cache=FALSE------------
require(StructFDR)
require(ape)
require(ggplot2)
require(reshape)

## ----simulation----------------------------------------------------------
# Generate artificial data
set.seed(12345)
data(throat.parameter)
data.obj <- SimulateData(nCases = 50, nControls = 50, nOTU = 400, nCluster = 20, 
		depth = 10000, p.est = throat.parameter$p.est, theta = throat.parameter$theta,
        scene = 'S1', signal.strength = 4)
Y <- data.obj$y
X <- data.obj$X 
tree <-data.obj$tree
clustering <- data.obj$clustering 
beta.true <- data.obj$beta.true
meta.dat <- data.frame(grp=factor(data.obj$y))

## ----simulation2---------------------------------------------------------
# Define test function based on a simple Wilcoxon rank-sum test
test.func <- function (X, Y) { 	
	Y <- as.numeric(factor(Y))
	obj <- apply(X, 1, function(x) { 				
				p.value <- suppressWarnings(wilcox.test(x ~ Y)$p.value)
				e.sign <- sign(mean(x[Y == 2]) - mean(x[Y == 1]))
				c(p.value, e.sign) 			
			})
	return(list(p.value=obj[1, ], e.sign=obj[2, ])) 
}

# Define permutation function, simple group label permutation
perm.func <- function (X, Y) { 	
    return(list(X=X, Y=sample(Y))) 
}


# Call TreeFDR
tree.fdr.obj <- TreeFDR(X, Y, tree, test.func, perm.func) 

# Performance measure: compare TreeFDR and BH
tree.p.adj <- tree.fdr.obj$p.adj
BH.p.adj <- p.adjust(tree.fdr.obj$p.unadj, 'fdr')

# Number of truly differential OTUs
sum(beta.true != 0) 

# Empirical power for treeFDR and BH procedure respectively
(tree.emp.pwr <- sum(tree.p.adj <= 0.05 & beta.true != 0) / sum(beta.true != 0)) 
(BH.emp.pwr <- sum(BH.p.adj <= 0.05 & beta.true != 0) / sum(beta.true != 0))

# Empirical FDR for treeFDR and BH procedure respectively
(tree.emp.fdr <- sum(tree.p.adj <= 0.05 & beta.true == 0) / sum(tree.p.adj <= 0.05)) 
(BH.emp.fdr <- sum(BH.p.adj <= 0.05 & beta.true == 0) / sum(BH.p.adj <= 0.05))

## ----Z_score_comparison, fig.height=4, fig.width=8-----------------------
# The effects of moderation by plotting unadjusted Z-score against adjusted Z-score.
par(mfrow=c(1, 2))
plot(clustering, tree.fdr.obj$z.unadj, ylab = 'Unadjusted Z-score')
plot(clustering, tree.fdr.obj$z.adj, ylab = 'Adjusted Z-score')

## ----simulation3---------------------------------------------------------
# Generate artificial data
set.seed(12345)
data.obj <- SimulateData(nCases = 50, nControls = 50, nOTU = 400, nCluster = 20, 
		depth = 10000, p.est = throat.parameter$p.est, theta = throat.parameter$theta,
        scene = 'S1', signal.strength = log(4), zero.pct = 0.1, balance = TRUE)
Y <- data.obj$y
X <- data.obj$X 
tree <-data.obj$tree
clustering <- data.obj$clustering 
beta.true <- data.obj$beta.true

## ----real_data-----------------------------------------------------------
data(alcohol)
set.seed(12345)

X <- alcohol$X
Y <- alcohol$Y 
tree <- alcohol$tree
tree.fdr.obj <- TreeFDR(X = X, Y = Y, tree = tree, test.func = test.func, perm.func = perm.func, B = 100)

# Compare treeFDR and BH procedure
tree.p.adj <- tree.fdr.obj$p.adj
BH.p.adj <- p.adjust(tree.fdr.obj$p.unadj, "fdr") 

# Empirical power
sum(tree.p.adj <= 0.1)
sum(BH.p.adj <= 0.1)

## ----otunames------------------------------------------------------------
# TreeFDR
alcohol$otu.name[rownames(alcohol$X)[tree.p.adj <= 0.1], c('Phylum', 'Class', 'Family')]
# BH
alcohol$otu.name[rownames(alcohol$X)[BH.p.adj <= 0.1], c('Phylum', 'Class', 'Family')]

## ----acohol_otu_number, fig.height=8, fig.width=8------------------------
dat <- sapply(seq(0.01, 0.2, len=20), function (x) {
			c(TreeFDR=sum(tree.p.adj <= x), BH=sum(BH.p.adj <= x))
		})
colnames(dat) <- seq(0.01, 0.2, len=20)
dat <- melt(dat)
colnames(dat) <- c('Method', 'FDR_cutoff', 'OTU_number')
dat$Method <- factor(dat$Method, levels=c('TreeFDR', 'BH'))
ggplot(dat, aes_string(x='FDR_cutoff', y='OTU_number', group = 'Method', 
						shape='Method', linetype='Method')) +
		geom_line(size=0.2) +
		geom_point(size=3) +
		ylab('Number of differential OTUs') +
		xlab('FDR level') +
		scale_shape_manual(values=c(15, 1)) +
		theme_bw()

## ----acohol_tree1, fig.height=8, fig.width=8-----------------------------
# BH
plot(tree, type = 'fan', edge.color = "gray", cex=0.2, tip.color = "black", 
		show.tip.label = F, label.offset=0.06) 
tiplabels(text="", tip=which(BH.p.adj <= 0.1), frame="n", pch=4, col="black")

## ----acohol_tree2, fig.height=8, fig.width=8-----------------------------
# TreeFDR
plot(tree, type = 'fan', edge.color = "gray", cex=0.2, tip.color = "black", 
		show.tip.label = F, label.offset=0.06) 
tiplabels(text="", tip=which(tree.p.adj <= 0.1), frame="n", pch=4, col="black")

