library(NRejections)


### Name: corr_tests
### Title: Global evidence strength across correlated tests
### Aliases: corr_tests

### ** Examples

# uses a too-small number of resamples as a toy example
corr_tests( d = attitude,
X = "complaints",
C = c("privileges", "learning"),
Ys = c("rating", "raises"),
B=50,
cores=1,
alpha = 0.05,
alpha.fam = 0.05,
method = c( "nreject", "bonferroni", "holm", "minP", "Wstep", "romano" ) )

## No test: 
data(rock)

res = corr_tests( d = rock,
                 X = c("area"),
                 C = NA,
                 Ys = c("perm", "peri", "shape"),
                 method = "nreject" )

# mean rejections in resamples
# should be close to 0.05 * 3 = 0.15
mean( as.numeric(res$nrej.bt) ) 
## End(No test)

## No test: 
cor = make_corr_mat( nX = 10,
nY = 20,
rho.XX = 0.10,
rho.YY = 0.5,
rho.XY = 0.1,
prop.corr = .4 )

d = sim_data( n = 300, cor = cor )

# X1 is the covariate of interest, and all other X variables are adjusted
all.covars = names(d)[ grep( "X", names(d) ) ]
C = all.covars[ !all.covars == "X1" ]

# may take 10 min to run
res = corr_tests( d,
                 X = "X1",
                 C = C,
                 Ys = names(d)[ grep( "Y", names(d) ) ],
                 method = "nreject" )

# look at the main results
res$null.int
res$excess.hits
res$global.test
## End(No test)



