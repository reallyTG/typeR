library(OptHedging)


### Name: hedging.iid
### Title: Value and optimal hedging strategy for a call or a put option
###   using simulations.
### Aliases: hedging.iid HedgingIID
### Keywords: Hedging Monte Carlo Call option Put option

### ** Examples

# Computes the price of a one-year maturity put option when hedged 5 times 
# at regular time intervals. 
# The model is assumed to be Black-Scholes with parameters mu and sigma, 
# so the excess periodic returns are Gaussian.

n = 5;         # number of hedging periods
m = 5001;      # number of points of the grid
minS = 80.0;   # minimum value of the grid
maxS = 120.0;  # maximum value of the grid
S0 = 100.0;    # initial value
K  = 100.0;    # strike price
T  = 1.0;      # maturity of the option
r  = 0.05;     # annual (continuous) rate 
put = 1;       # Put = 0 implies call!
  

#Simulation of excess periodic returns
sigma = 0.06;  # annual volatility of the returns
mu = 0.09;     # annual mean of the returns
Tp = T/n;
rp = r*Tp;
sigmap = sigma*sqrt(Tp);
Kp = K*exp(-r*T);
mup = mu*Tp-0.5*sigmap*sigmap;

#Gaussian excess returns
N = 10000;     # number of simulated returns
R = mup -rp +sigmap*rnorm(N);


# Computation
out0 = hedging.iid(R,T,K,r,put,n,m,minS,maxS)

C = out0$C;
a = out0$a;
rho = out0$rho;
S = out0$S;
phi1 = out0$phi1;

# Initial value of the option computed from interpolating C
C0 = interpol1d(S0,C[1,],minS,maxS);

# Initial value of the option computed from interpolating C
phi = (interpol1d(S0,a[1,],minS,maxS)-C0*rho)/S0;

par(mfrow=c(2,1))
plot(S,C[1,],type='s',main=bquote('Put values ' * C[0] * ' at time 0  for n' ==.(n)  ))


plot(S,phi1,type='s',main=expression('Number of shares ' *phi[1] * ' at start'))

par(new=TRUE)
C0
phi


