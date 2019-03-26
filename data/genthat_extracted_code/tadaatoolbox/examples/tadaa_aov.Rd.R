library(tadaatoolbox)


### Name: tadaa_aov
### Title: Tadaa, ANOVA!
### Aliases: tadaa_aov

### ** Examples

tadaa_aov(stunzahl ~ jahrgang, data = ngo)
tadaa_aov(stunzahl ~ jahrgang * geschl, data = ngo)

# Other types of sums and print options
## Not run: 
##D tadaa_aov(stunzahl ~ jahrgang * geschl, data = ngo, type = 1, print = "console")
##D tadaa_aov(stunzahl ~ jahrgang * geschl, data = ngo, type = 3, print = "console")
##D tadaa_aov(stunzahl ~ jahrgang * geschl, data = ngo,
##D           type = 3, check_contrasts = FALSE, print = "console")
## End(Not run)



