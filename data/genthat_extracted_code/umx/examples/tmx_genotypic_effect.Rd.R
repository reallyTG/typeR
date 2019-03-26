library(umx)


### Name: tmx_genotypic_effect
### Title: Graphical display of genotypic effects.
### Aliases: tmx_genotypic_effect

### ** Examples

library(umx);
tmx_genotypic_effect(p = .5, q =.5, a =.5, d = 1, m = 0)

# ================
# = No dominance =
# ================
tmx_genotypic_effect(p = .5, a = 1, d = 0, m = 0, show = TRUE);

# ======================
# = Complete dominance =
# ======================
tmx_genotypic_effect(p = .5, a = 1, d = 0, m = 0, show = TRUE);

p = tmx_genotypic_effect(p = .5, q = .5, a = 1, d = .0, m = 0, show = TRUE);
p = tmx_genotypic_effect(p = .5, q = .5, a = 1, d = .5, m = 0, show = TRUE); 
p
# p + geom_point() + geom_text(hjust = 0, nudge_x = 0.05)
# ggsave(paste0(base, "c03_genotypic_effect_by_gene_dose.pdf"), width = 4.6, height = 4.6)



