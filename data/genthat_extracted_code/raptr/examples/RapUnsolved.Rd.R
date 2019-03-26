library(raptr)


### Name: RapUnsolved
### Title: Create a new RapUnsolved object
### Aliases: RapUnsolved

### ** Examples

## No test: 
# set random number generator seed
set.seed(500)

# load data
data(cs_pus, cs_spp)

# create inputs for RapUnsolved
ro <- RapUnreliableOpts()
rd <- make.RapData(cs_pus[seq_len(10), ], cs_spp, NULL,
                   include.geographic.space = TRUE,n.demand.points = 5L)

# create RapUnsolved object
ru <- RapUnsolved(ro, rd)

# print object
print(ru)
## End(No test)



