library(HLMdiag)


### Name: dotplot_diag
### Title: Dot plots for influence diagnostics
### Aliases: dotplot_diag
### Keywords: hplot

### ** Examples

library(lme4)
fm <- lmer(Reaction ~ Days + (Days | Subject), sleepstudy)

# Subject level deletion and diagnostics
subject.del  <- case_delete(model = fm, group = "Subject", type = "both")
subject.diag <- diagnostics(subject.del)

dotplot_diag(x = COOKSD, index = IDS, data = subject.diag[["fixef_diag"]],
             name = "cooks.distance", modify = FALSE,
             xlab = "Subject", ylab = "Cook's Distance")

dotplot_diag(x = sigma2, index = IDS, data = subject.diag[["varcomp_diag"]],
             name = "rvc", modify = "dotplot", cutoff = "internal",
             xlab = "Subject", ylab = "Relative Variance Change")

dotplot_diag(x = sigma2, index = IDS, data = subject.diag[["varcomp_diag"]],
             name = "rvc", modify = "boxplot", cutoff = "internal",
             xlab = "Subject", ylab = "Relative Variance Change")



