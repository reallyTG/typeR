## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
collapse = TRUE,
comment = "#>"
)

## ------------------------------------------------------------------------
require("epiGWAS")
data(genotypes)
data(maf)

## ------------------------------------------------------------------------
set.seed(347)
sigma <- cor(genotypes)
sigma_distance <- as.dist(1 - abs(sigma))
hc <- hclust(sigma_distance, method = "single")
corr_max <- 0.5
clusters <- cutree(hc, h = 1 - corr_max)

## ------------------------------------------------------------------------
# Parameterization of the disease model
window_target <- 3 # Width of the LD window on each side of the target
nX <- 80 # Number of SNPs interacting with the target
nY <- 20 # Number of SNPs with marginal effects
nZ12 <- 20 # Number of SNP pairs with epistatic effects
overlap_marg <- 10 # Number of SNPs interacting with the target in addition to having marginal effects
overlap_inter <- 5 # Number of SNPs interacting with the target in addition to having epistatic effects

## ------------------------------------------------------------------------
set.seed(347)
causal <- sample_SNP(
  nX, nY, nZ12,
  clusters, maf, thresh_MAF = 0.01,
  window_size = window_target, overlap_marg = overlap_marg, overlap_inter = overlap_inter
)
clusters <- merge_cluster(clusters, center = clusters[causal$target], k = window_target)

## ------------------------------------------------------------------------
genotypes <- genotypes[, (clusters != clusters[causal$target]) | (colnames(genotypes) == causal$target)]

## ------------------------------------------------------------------------
set.seed(347)
model <- gen_model(nX, nY, nZ12, mean = rep(0, 4), sd = rep(1, 4)) # Sampling of size effects
phenotype <- sim_phenotype(genotypes, causal, model) # Phenotype simulation

## ------------------------------------------------------------------------
data("propensity")
A <- genotypes[, causal$target] > 0
X <- genotypes[, colnames(genotypes) != causal$target]

## ------------------------------------------------------------------------
stability_scores <- epiGWAS(A, X, phenotype, propensity,
                            methods = c("OWL", "modified_outcome", "shifted_outcome",
                                        "normalized_outcome", "robust_outcome"),
                            parallel = FALSE)

## ---- echo=FALSE---------------------------------------------------------
labels <- colnames(X) %in% causal$syner # The positives are the SNPs interacting interacting with the target

require("precrec", quietly = TRUE)
require("knitr", quietly = TRUE)
require("kableExtra", quietly = TRUE)

stability_scores <- join_scores(stability_scores)

format_scores <- mmdata(
  scores = stability_scores,
  labels = labels,
  modnames = c("OWL", "Modified outcome", "Shifted modified outcome",
               "Normalized modified outcome", "Robust modified outcome")
)

perf_metrics <- evalmod(format_scores)
aucs <- auc(perf_metrics)

PRC <- subset(aucs, curvetypes == "PRC", select = c("modnames", "aucs"))
colnames(PRC) <- c("Method", "PRC")
rownames(PRC) <- NULL
ROC <- subset(aucs, curvetypes == "ROC", select = c("modnames", "aucs"))
colnames(ROC) <- c("Method", "ROC")
rownames(ROC) <- NULL
aucs_table <- merge(x = ROC, y = PRC, by = "Method", all = TRUE)
kable(aucs_table, caption = "Areas under the ROC and PR curves")  %>%
  kable_styling("striped", full_width = FALSE) %>%
  row_spec(which(aucs_table$Method == "Robust modified outcome"), bold = TRUE, color = "white", background = "#37648d")

