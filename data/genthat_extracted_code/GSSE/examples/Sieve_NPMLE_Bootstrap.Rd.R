library(GSSE)


### Name: Sieve_NPMLE_Bootstrap
### Title: Sieve_NPMLE_Bootstrap function
### Aliases: Sieve_NPMLE_Bootstrap

### ** Examples


data("Simulated_data");

OID = Simulated_data[,1];
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

SieveNPMLE_result = Sieve_NPMLE_Switch( Y=Y, Delta=Delta, p0G=p0G, px=px,
                                        Grid=Grid, Knot=7, degree=3  );

Lambda_1.hat = cumsum( SieveNPMLE_result$lamb1.hat );
Lambda_2.hat = cumsum( SieveNPMLE_result$lamb2.hat );

F_carr_func = function(x){ 1 - exp( - max( Lambda_1.hat[Y <= x] ) ) }
F_non_func  = function(x){ 1 - exp( - max( Lambda_2.hat[Y <= x] ) ) }

est.f1 = apply(matrix(fix_t1, ncol=1), 1, F_carr_func );
est.f2 = apply(matrix(fix_t2, ncol=1), 1, F_non_func  );

# ---------------- #
#    Bootstrap     #
# ---------------- #

 Boot = Sieve_NPMLE_Bootstrap( fam_ID=OID, Y0=OY, Delta0=ODelta, p0G0=Op0G,
                               fix_t1=fix_t1, fix_t2=fix_t2, Grid = Grid,
                               Knot=6, degree =3, Bn=10  );

 SE1 = Boot$SE_F1_fix_t;
 SE2 = Boot$SE_F2_fix_t;

 estp = data.frame( fix_t1 = fix_t1, F1.hat = est.f1, SE_F1 = SE1,
                    fix_t2 = fix_t2, F2.hat = est.f2, SE_F2 = SE2  );

 print(estp)




