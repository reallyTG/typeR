library(esc)


### Name: esc_bin_prop
### Title: Compute effect size from binary proportions
### Aliases: esc_bin_prop

### ** Examples

# effect size log odds
esc_bin_prop(prop1event = .375, grp1n = 80, prop2event = .47, grp2n = 85)

# effect size odds ratio
esc_bin_prop(prop1event = .375, grp1n = 80, prop2event = .47, grp2n = 85,
             es.type = "or")




