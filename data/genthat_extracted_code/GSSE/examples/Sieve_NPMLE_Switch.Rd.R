library(GSSE)


### Name: Sieve_NPMLE_Switch
### Title: Sieve_NPMLE_Switch function
### Aliases: Sieve_NPMLE_Switch

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
px = seq(0.01, 3.65, 0.01);

SieveNPMLE_result = Sieve_NPMLE_Switch( Y=Y, Delta=Delta, p0G=p0G,
                                        px=px, Grid=Grid,
                                        Knot=6, degree=3  );

# 'Sieve_NPMLE_Switch' only returns values of hazard function 
# or cumulative hazard function of mutation groups, in practice, we only 
# need to do a little bit more as follows for calculating the 
# cumulative distribution values of mutation groups. 

Lambda_1.hat = cumsum( SieveNPMLE_result$lamb1.hat );
Lambda_2.hat = cumsum( SieveNPMLE_result$lamb2.hat );

F_carr_func = function(x){ 1 - exp(- max( Lambda_1.hat[Y <= x] ) ) }
F_non_func  = function(x){ 1 - exp(- max( Lambda_2.hat[Y <= x] ) ) }

est.f1 = apply(matrix(fix_t1, ncol=1), 1, F_carr_func );
est.f2 = apply(matrix(fix_t2, ncol=1), 1, F_non_func  );

estp = data.frame( fix_t1 = fix_t1, F_carr_t1 = est.f1,
                   fix_t2 = fix_t2, F_non_t2 = est.f2  );

print(estp);

# plot estimated curves

F_carr = apply( matrix(px, ncol=1), 1, F_carr_func );
F_non = apply( matrix(px, ncol=1), 1, F_non_func );

plot( px, F_carr, type='s', lty=1, ylim=c(0, 1), xlab="Y",
      ylab="Estimated Cumulative Distribution Function", col='blue' );
lines(px, F_non, type='s', lty=2, col='red');
legend("topleft", legend=c("Carrier group", "Non-Carrier group"),
       lty=c(1,2), col=c("blue","red") );




