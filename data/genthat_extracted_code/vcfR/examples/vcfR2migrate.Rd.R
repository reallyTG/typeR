library(vcfR)


### Name: vcfR2migrate
### Title: Convert a vcfR object to MigrateN input file
### Aliases: vcfR2migrate

### ** Examples

## Not run: 
##D data(vcfR_example)
##D my_pop <- as.factor(paste("pop_", rep(c("A", "B", "C"), each = 6), sep = ""))
##D vcfR2migrate(vcf = vcf , pop = my_pop , in_pop = c("pop_A","pop_C"),
##D              out_file = "my2pop.txt", method = 'H')
## End(Not run)





