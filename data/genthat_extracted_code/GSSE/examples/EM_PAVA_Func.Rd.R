library(GSSE)


### Name: EM_PAVA_Func
### Title: EM-PAVA function
### Aliases: EM_PAVA_Func

### ** Examples


data("Simulated_data");

OY = Simulated_data[,2];
ind = order(OY);
ODelta = Simulated_data[,3];
Op0G = Simulated_data[,4];

Y = OY[ind];
Delta = ODelta[ind];
p0G = Op0G[ind];

Grid = seq(0.01, 3.65, 0.01);
fix_t1 = c(0.288, 0.693, 1.390);
fix_t2 = c(0.779, 1.860, 3.650);

EMpava_result = EM_PAVA_Func ( q = rbind(p0G,1-p0G), x = Y, delta = Delta, 
                               timeval = Grid, p = 2, ep = 1e-4 );

all = sort(c(Grid, Y));

F_carr_func = function(x){  EMpava_result$Fest.all[1, which.max(all[all <= x]) ]  };
F_non_func  = function(x){  EMpava_result$Fest.all[2, which.max(all[all <= x]) ]  };

PAVA_F1.hat_fix_t = apply( matrix(fix_t1, ncol=1), 1, F_carr_func );
PAVA_F2.hat_fix_t = apply( matrix(fix_t2, ncol=1), 1, F_non_func );

PAVA_F.hat_fix_t = data.frame( fix_t1 = fix_t1, PAVA_F1.hat = PAVA_F1.hat_fix_t,
                               fix_t2 = fix_t2, PAVA_F2.hat = PAVA_F2.hat_fix_t  );

print(PAVA_F.hat_fix_t);

# plot estimated curves

F_carr = apply( matrix(Grid, ncol=1), 1, F_carr_func );
F_non = apply( matrix(Grid, ncol=1), 1, F_non_func );

plot( Grid, F_carr, type = 's', lty = 1, 
      xlab = "Y", ylab = "Estimated Cumulative Distribution Function",
      ylim = c(0,1), col = 'blue' );
lines(Grid, F_non, type='s', lty=2, col='red');
legend("topleft", legend=c("Carrier group", "Non-Carrier group"),
       lty=c(1,2), col=c("blue", "red") );




