library(WebPower)


### Name: wp.lcsm
### Title: Statistical Power Curve for Univariate Latent Change Score
###   Models based on Monte Carlo Simulation
### Aliases: wp.lcsm

### ** Examples

## Not run: 
##D #Power analysis for a univariate LCSM
##D #Power for each parameter given sample size, number of measurement occasions,
##D # true effect (true values of parameters), and significance level:
##D wp.lcsm(N = 100, T = 5, R = 1000, betay = 0.1, my0 = 20, mys = 1.5,
##D         varey = 9, vary0 = 2.5, varys = .05, vary0ys = 0, alpha = 0.05)   
##D #           pop.par mc.est mc.sd mc.se mc.power  N  T
##D #    betay   0.10   0.103  0.043 0.044  0.664   100 5
##D #    my0    20.00  19.999  0.324 0.319  1.000   100 5
##D #    mys     1.50   1.418  1.106 1.120  0.274   100 5
##D #    varey   9.00   8.961  0.724 0.732  1.000   100 5
##D #    vary0   2.50   2.463  1.151 1.139  0.583   100 5
##D #    vary0ys 0.00  -0.004  0.408 0.403  0.048   100 5
##D #    varys   0.05   0.053  0.173 0.175  0.050   100 5
##D #  
##D #  #To calculate the Type I error rate and power for parameters
##D   wp.lcsm(N = 100, T = 5, R = 1000, betay = 0, my0 = 0, mys = 0,
##D               varey = 1, vary0 = 1, varys = 1, vary0ys = 0,alpha = 0.05)
##D #           pop.par	mc.est	mc.sd	mc.se	mc.power N	T
##D #    betay   0		0.001	0.056	0.056	0.046	100 5
##D #    my0		0		0.001	0.129	0.126	0.056	100 5
##D #    mys		0		0.002	0.105	0.105	0.044	100 5
##D #    varey   1		0.994	0.083	0.081	1.000	100 5
##D #    vary0   1		0.990	0.236	0.230	1.000	100 5
##D #    vary0ys	0		-0.005	0.136	0.136	0.044	100 5
##D #    varys   1		1.006	0.227	0.227	1.000	100 5
##D 
##D # To generate a power curve for different sample sizes for a univariate LCSM
##D res <- wp.lcsm(N = seq(100, 200, 10), T = 5, R = 1000, betay = 0.1,
##D                           my0 = 20, mys = 1.5, varey = 9, vary0 = 2.5,
##D                                varys = .05, vary0ys = 0, alpha = 0.05)
##D #plot(res, parameter='betay')
##D #plot(res, parameter='mys')
##D 
##D # To generate a power curve for different numbers of occasions for a univariate LCSM
##D res <- wp.lcsm(N = 100, T = 4:10, R = 1000, betay = 0.1, my0 = 20, mys = 1.5,
##D                 varey = 9, vary0 = 2.5, varys = .05, vary0ys = 0, alpha = 0.05)
##D #plot(res, parameter='betay')
##D #plot(res, parameter='mys')
## End(Not run)




