## ----setup,echo=FALSE,results='hide',include=FALSE, cache=FALSE----------
library(knitr)
theme <- list(
	highlight=paste0(collapse="\n", c(
		"\\definecolor{fgcolor}{rgb}{0, 0, 0}",
		"\\newcommand{\\hlnum}[1]{\\textcolor[rgb]{0,0,0}{#1}}%",
		"\\newcommand{\\hlstr}[1]{\\textcolor[rgb]{0, 0, 0}{#1}}%",
		"\\newcommand{\\hlcom}[1]{\\textcolor[rgb]{0,0,0}{\\textit{#1}}}%",
		# dollar
		"\\newcommand{\\hlopt}[1]{\\textcolor[rgb]{0,0,0}{\\textbf{#1}}}%",
		"\\newcommand{\\hlstd}[1]{\\textcolor[rgb]{0,0,0}{#1}}%",
		# 'function'
		"\\newcommand{\\hlkwa}[1]{\\textcolor[rgb]{0,0,0}{\\textbf{#1}}}%",
		# assign to
		"\\newcommand{\\hlkwb}[1]{\\textcolor[rgb]{0,0,0}{\\textbf{#1}}}%",
		# argument names
		"\\newcommand{\\hlkwc}[1]{\\textcolor[rgb]{0,0,0}{#1}}%",
		# function names
		"\\newcommand{\\hlkwd}[1]{\\textcolor[rgb]{0,0,0}{\\textbf{#1}}}%",
		"\\let\\hlipl\\hlkwb"
	)),
	background="#ffffff",
	foreground="#000000"
)

knit_theme$set(theme)
opts_chunk$set(prompt=TRUE)
library(BeviMed)
set.seed(1)
N <- 10
k <- 5
af <- 0.1
G <- matrix(nrow=N, ncol=k, data=rbinom(n=N*k, size=2, prob=af))
k_patho <- 3
z <- c(rep(TRUE, k_patho), rep(FALSE, k-k_patho))
y <- apply(G[,z,drop=FALSE], 1, sum) > 0

## ----simple, echo=TRUE---------------------------------------------------
obj <- bevimed(y=y, G=G)

## ----print, echo=TRUE----------------------------------------------------
obj

## ----polytomous, echo=TRUE-----------------------------------------------
bevimed_polytomous(y=G[,1] > 0, G=G, variant_sets=list(`first`=1, `all`=1:ncol(G)))

## ----multiple, eval=FALSE, echo=TRUE-------------------------------------
#  source(paste0(system.file(package="BeviMed", "/scripts/vcf.R")))
#  all_variants <- vcf2matrix("my-vcf.vcf.gz", chr="1", from=1, to=1e9, include_variant_info=TRUE)
#  row_indices_per_gene <- lapply(1:nrow(chr1genes), function(i) {
#  	which(all_variants$info$POS >= chr1genes$start[i] & all_variants$info$POS <= chr1genes$end[i])
#  })
#  names(row_indices_per_gene) <- chr1genes$gene
#  
#  results <- mclapply(
#  	mc.cores=16L,
#  	X=chr1genes$gene,
#  	FUN=function(gene) {
#  		G <- all_variants$G[variant_inds[[gene]],,drop=FALSE]
#  		c(
#  			list(gene=gene),
#  			summary(bevimed(y=y, G=G))) })
#  
#  results_table <- do.call(what=rbind, lapply(results, function(x) data.frame(
#  	Gene=x[["gene"]],
#  	`Prob. assoc`=sum(x[["prob_association"]]),
#  	`Prob. dominance`=x[["prob_association"]]["dominant"]/sum(x[["prob_association"]]),
#  	check.names=FALSE,
#  	stringsAsFactors=FALSE
#  )))

