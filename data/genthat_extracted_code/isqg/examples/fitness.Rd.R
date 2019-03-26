library(isqg)


### Name: fitness
### Title: Simulated Trait for Individuals According to Basic Models
### Aliases: fitness set_infty set_quant

### ** Examples

data(ToyMap)
spc <- set_specie(ToyMap)
AA <- founder(spc, "AA")
aa <- spc$founder("aa")

F1  <- cross(n = 1, AA, aa) # the hybrid

## set a infinitesimal & a quantitative fitness
infty <- set_infty(spc, m = 0, a = 1, d = .5) # partial dominance
genes <- data.frame(snp = sample(ToyMap$snp, 10), add = rnorm(10), dom = rnorm(10))
quant <- set_quant(spc, m = 0, data = genes)

## evaluating the breeding value 
infty$alpha(AA)
quant$alpha(F1)




