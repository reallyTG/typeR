library(WebPower)


### Name: wp.blcsm
### Title: Statistical Power Curve for Bivariate Latent Change Score Models
###   based on Monte Carlo Simulation
### Aliases: wp.blcsm

### ** Examples

## Not run: 
##D #To conduct power analysis for a bivariate LCSM with sample size equal to 100:
##D wp.blcsm(N=100, T=5, R=1000, betay=0.08, my0=20, mys=1.5, varey=9,
##D      vary0=3, varys=1, vary0ys=0, alpha=0.05, betax=0.2, mx0=20, mxs=5,
##D          varex=9, varx0=3, varxs=1, varx0xs=0, varx0y0=1, varx0ys=0,
##D                             vary0xs=0, varxsys=0, gammax=0, gammay=-.1)
##D #             pop.par mc.est  mc.sd  mc.se  mc.power N T
##D #    betax    0.20     0.230  0.260  0.187  0.241   100 5
##D #    betay    0.08     0.164  0.572  0.435  0.081   100 5
##D #    gammax   0.00    -0.033  0.234  0.178  0.112   100 5
##D #    gammay  -0.10    -0.175  0.641  0.458  0.075   100 5
##D #    mx0     20.00    20.004  0.336  0.326  1.000   100 5
##D #    mxs      5.00     5.933  7.848  5.615  0.167   100 5
##D #    my0     20.00    20.019  0.346  0.326  1.000   100 5
##D #    mys      1.50     0.451  6.933  5.321  0.156   100 5
##D #    varex    9.00     8.941  0.744  0.732  1.000   100 5
##D #    varey    9.00     8.939  0.749  0.720  1.000   100 5
##D #    varx0    3.00     3.029  1.243  1.222  0.739   100 5
##D #    varx0xs  0.00    -0.210  0.768  0.767  0.030   100 5
##D #    varx0y0  1.00     1.052  0.840  0.835  0.226   100 5
##D #    varx0ys  0.00    -0.012  0.668  0.601  0.017   100 5
##D #    varxs    0.60     2.343  6.805  2.687  0.090   100 5
##D #    varxsys  0.00     0.072  3.559  1.740  0.019   100 5
##D #    vary0    3.00     2.951  1.423  1.245  0.684   100 5
##D #    vary0xs  0.00     0.198  2.263  1.629  0.031   100 5
##D #    vary0ys  0.00    -0.371  1.970  1.511  0.106   100 5
##D #    varys    0.05     1.415  3.730  2.096  0.024   100 5
##D 
##D #To conduct power analysis for a bivariate LCSM with sample size equal to 500:
##D wp.blcsm(N=500, T=5, R=1000, betay=0.08, my0=20, mys=1.5, varey=9,
##D       vary0=3, varys=1, vary0ys=0, alpha=0.05, betax=0.2, mx0=20
##D            , mxs=5, varex=9, varx0=3, varxs=1, varx0xs=0, varx0y0=1,
##D                  varx0ys=0, vary0xs=0, varxsys=0, gammax=0, gammay=-.1)
##D #           pop.par mc.est mc.sd mc.se  mc.power N  T
##D #    betax    0.20  0.2009 0.031 0.031   1.000  500 5
##D #    betay    0.08  0.0830 0.070 0.068   0.199  500 5
##D #    gammax   0.00 -0.0014 0.030 0.029   0.057  500 5
##D #    gammay  -0.10 -0.1022 0.072 0.073   0.271  500 5
##D #    mx0     20.00 19.9911 0.145 0.145   1.000  500 5
##D #    mxs      5.00  5.0308 0.939 0.942   1.000  500 5
##D #    my0     20.00 19.9999 0.143 0.146   1.000  500 5
##D #    mys      1.50  1.4684 0.889 0.885   0.420  500 5
##D #    varex    9.00  8.9836 0.340 0.328   1.000  500 5
##D #    varey    9.00  8.9961 0.341 0.328   1.000  500 5
##D #    varx0    3.00  3.0052 0.524 0.523   1.000  500 5
##D #    varx0xs  0.00 -0.0144 0.222 0.230   0.047  500 5
##D #    varx0y0  1.00  1.0064 0.360 0.360   0.808  500 5
##D #    varx0ys  0.00 -0.0012 0.199 0.201   0.051  500 5
##D #    varxs    1.00  1.0312 0.180 0.189   1.000  500 5
##D #    varxsys  0.00  0.0028 0.161 0.163   0.045  500 5
##D #    vary0    3.00  2.9777 0.519 0.547   1.000  500 5
##D #    vary0xs  0.00  0.0072 0.286 0.294   0.035  500 5
##D #    vary0ys  0.00 -0.0135 0.252 0.257   0.043  500 5
##D #    varys    1.00  1.0246 0.260 0.253   0.999  500 5
## End(Not run)




