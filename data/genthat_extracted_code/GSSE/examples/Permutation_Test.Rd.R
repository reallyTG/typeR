library(GSSE)


### Name: Permutation_Test
### Title: Permutation Test
### Aliases: Permutation_Test

### ** Examples


data("Simulated_data");

OY = Simulated_data[,2];
ind = order(OY);
ODelta = Simulated_data[,3];
Op0G = Simulated_data[,4];

Y = OY[ind];
Delta = ODelta[ind];
p0G = Op0G[ind];

Grid = seq(0.2, 3.65, 0.05);
fix_t1 = c(0.288, 0.693, 1.390);
fix_t2 = c(0.779, 1.860, 3.650);
px = seq(0.1, 3, 0.1);

SieveNPMLE_result = Sieve_NPMLE_Switch( Y=Y, Delta=Delta, p0G=p0G,
                                        px=px, Grid=Grid, Knot=7,
                                        degree=3 );

Lambda_1.hat = cumsum( SieveNPMLE_result$lamb1.hat );
Lambda_2.hat = cumsum( SieveNPMLE_result$lamb2.hat );

F_carr_func = function(x){ 1 - exp( max( Lambda_1.hat[Y <= x] ) ) }
F_non_func  = function(x){ 1 - exp( max( Lambda_2.hat[Y <= x] ) ) }

F_carr = apply( matrix(px, ncol=1), 1, F_carr_func );
F_non = apply( matrix(px, ncol=1), 1, F_non_func );

# Permutation test #

Permutation_Test( Grid=Grid, F_carr=F_carr, F_non=F_non,
                  OY=OY, ODelta=ODelta, Op0G=Op0G,
                  nperm=10 );




