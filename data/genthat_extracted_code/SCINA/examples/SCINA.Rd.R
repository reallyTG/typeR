library(SCINA)


### Name: SCINA
### Title: A semi-supervised cell type identification and assignment tool.
### Aliases: SCINA

### ** Examples

load(system.file('extdata','example_expmat.RData', package = "SCINA"))
load(system.file('extdata','example_signatures.RData', package = "SCINA"))
exp = exp_test$exp_data
results = SCINA(exp, signatures, max_iter = 120, convergence_n = 12, 
    convergence_rate = 0.999, sensitivity_cutoff = 0.9)
table(exp_test$true_label, results$cell_labels)



