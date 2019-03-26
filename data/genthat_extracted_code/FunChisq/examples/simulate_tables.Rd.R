library(FunChisq)


### Name: simulate_tables
### Title: Simulate Diverse Discrete Patterns via Noisy Contingency Tables
### Aliases: simulate_tables
### Keywords: datagen

### ** Examples

## Not run: 
##D # In all examples, x is the row variable and y is the column
##D #    variable of a table.
##D 
##D # Example 1. Simulating a noisy function where y=f(x),
##D #            x may or may not be g(y)
##D 
##D tbls <- simulate_tables(n=100, nrow=4, ncol=5, type="functional",
##D                 noise=0.2, n.tables = 1,
##D                 row.marginal = c(0.3,0.2,0.3,0.2))
##D 
##D par(mfrow=c(2,2))
##D plot_table(tbls$pattern.list[[1]], main="Ex 1. Functional pattern")
##D plot_table(tbls$sample.list[[1]], main="Ex 1. Sampled pattern (noise free)")
##D plot_table(tbls$noise.list[[1]], main="Ex 1. Sampled pattern with 0.2 noise")
##D plot.new()
##D 
##D # Example 2. Simulating a noisy functional pattern where
##D #            y=f(x), x may or may not be g(y)
##D 
##D tbls <- simulate_tables(n=100, nrow=4, ncol=5, type="functional",
##D                 noise=0.5, n.tables = 1,
##D                 row.marginal = c(0.3,0.2,0.3,0.2))
##D 
##D par(mfrow=c(2,2))
##D plot_table(tbls$pattern.list[[1]], main="Ex 2. Functioal pattern", col="seagreen2")
##D plot_table(tbls$sample.list[[1]], main="Ex 2. Sampled pattern (noise free)", col="seagreen2")
##D plot_table(tbls$noise.list[[1]], main="Ex 2. Sampled pattern with 0.5 noise", col="seagreen2")
##D plot.new()
##D 
##D 
##D # Example 3. Simulating a noise free many.to.one function where
##D #            y=f(x), x!=f(y).
##D 
##D tbls <- simulate_tables(n=100, nrow=4, ncol=5, type="many.to.one",
##D                 noise=0.2, n.tables = 1,
##D                 row.marginal = c(0.4,0.3,0.1,0.2))
##D par(mfrow=c(2,2))
##D plot_table(tbls$pattern.list[[1]], main="Ex 3. Many-to-one pattern", col="limegreen")
##D plot_table(tbls$sample.list[[1]], main="Ex 3. Sampled pattern (noise free)", col="limegreen")
##D plot_table(tbls$noise.list[[1]], main="Ex 3. Sampled pattern with 0.2 noise", col="limegreen")
##D plot.new()
##D 
##D # Example 4. Simulating noise-free discontinuous
##D #   pattern where y=f(x), x may or may not be g(y)
##D 
##D tbls <- simulate_tables(n=100, nrow=4, ncol=5,
##D                 type="discontinuous", noise=0.2,
##D                 n.tables = 1, row.marginal = c(0.2,0.4,0.2,0.2))
##D 
##D par(mfrow=c(2,2))
##D plot_table(tbls$pattern.list[[1]], main="Ex 4. Discontinuous pattern", col="springgreen3")
##D plot_table(tbls$sample.list[[1]], main="Ex 4. Sampled pattern (noise free)", col="springgreen3")
##D plot_table(tbls$noise.list[[1]], main="Ex 4. Sampled pattern with 0.2 noise", col="springgreen3")
##D plot.new()
##D 
##D 
##D # Example 5. Simulating noise-free dependent.non.functional
##D #            pattern where y!=f(x) and x and y are statistically
##D #            dependent.
##D 
##D tbls <- simulate_tables(n=100, nrow=4, ncol=5,
##D                 type="dependent.non.functional", noise=0.3,
##D                 n.tables = 1, row.marginal = c(0.2,0.4,0.2,0.2))
##D 
##D par(mfrow=c(2,2))
##D plot_table(tbls$pattern.list[[1]], main="Ex 5. Dependent.non.functional pattern",
##D col="sienna2", highlight="none")
##D plot_table(tbls$sample.list[[1]], main="Ex 5. Sampled pattern (noise free)",
##D col="sienna2", highlight="none")
##D plot_table(tbls$noise.list[[1]], main="Ex 5. Sampled pattern with 0.3 noise",
##D col="sienna2", highlight="none")
##D plot.new()
##D 
##D # Example 6. Simulating a pattern where x and y are
##D #            statistically independent.
##D 
##D tbls <- simulate_tables(n=100, nrow=4, ncol=5, type="independent",
##D                 noise=0.3, n.tables = 1,
##D                 row.marginal = c(0.4,0.3,0.1,0.2),
##D                 col.marginal = c(0.1,0.2,0.4,0.2,0.1))
##D 
##D par(mfrow=c(2,2))
##D plot_table(tbls$pattern.list[[1]], main="Ex 6. Independent pattern",
##D col="cornflowerblue", highlight="none")
##D plot_table(tbls$sample.list[[1]], main="Ex 6. Sampled pattern (noise free)",
##D col="cornflowerblue", highlight="none")
##D plot_table(tbls$noise.list[[1]], main="Ex 6. Sampled pattern with 0.3 noise",
##D col="cornflowerblue", highlight="none")
##D plot.new()
##D 
## End(Not run)




