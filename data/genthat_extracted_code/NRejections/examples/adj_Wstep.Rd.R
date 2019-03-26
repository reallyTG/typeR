library(NRejections)


### Name: adj_Wstep
### Title: Return Wstep-adjusted p-values
### Aliases: adj_Wstep

### ** Examples

# observed p-values for 3 tests
 pvals = c(0.00233103655078803, 0.470366742594242, 0.00290278216035089
)

# bootstrapped p-values for 5 resamples
p.bt = t( structure(c(0.308528665936264, 0.517319402377912, 0.686518314693482,
                  0.637306248855186, 0.106805510862352, 0.116705315041494, 0.0732076817175753,
                  0.770308936364482, 0.384405349738909, 0.0434358213611965, 0.41497067850141,
                  0.513471489744384, 0.571213377144122, 0.628054979652722, 0.490196884985226
), .Dim = c(5L, 3L)) )

# adjust the p-values
adj_Wstep( p = pvals, p.bt = p.bt )



