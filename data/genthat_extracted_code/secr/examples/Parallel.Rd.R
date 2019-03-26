library(secr)


### Name: Parallel
### Title: Multi-core Processing
### Aliases: Parallel ncores 'Multi-core processing'

### ** Examples


## Not run: 
##D 
##D sessionInfo()
##D # R version 3.2.0 (2015-04-16)
##D # Platform: x86_64-w64-mingw32/x64 (64-bit)
##D # Running under: Windows 7 x64 (build 7601) Service Pack 1
##D # quad-core i7 CPU, 16 Gb RAM
##D # ...
##D 
##D ## almost no benefit with secr.fit
##D 
##D for (i in 1:5) 
##D     print(system.time(secr.fit(ovenCH, buffer = 400, trace = FALSE, ncores = i)))
##D 
##D #   user  system elapsed 
##D #  52.26    0.76   53.02 
##D #   user  system elapsed 
##D #   3.38    2.77   48.36 
##D #   user  system elapsed 
##D #   5.69    5.36   47.18 
##D #   user  system elapsed 
##D #   6.50    6.90   54.51 
##D #   user  system elapsed 
##D #   7.74    8.25   50.23 
##D 
##D ## better for simulation, up to a point
##D  
##D for (i in 1:8)
##D     print(system.time(sim.secr(secrdemo.0, nsim = 20, tracelevel = 0, ncores = i)))
##D 
##D #   user  system elapsed 
##D # 262.93    3.74  266.71 
##D #   user  system elapsed 
##D #   0.68    0.02  139.61 
##D #   user  system elapsed 
##D #   0.69    0.01  110.05 
##D #   user  system elapsed 
##D #   0.70    0.00   84.24 
##D #   user  system elapsed 
##D #   0.70    0.02   69.45 
##D #   user  system elapsed 
##D #   0.67    0.06   75.67 
##D #   user  system elapsed 
##D #   0.75    0.00   70.00 
##D #   user  system elapsed 
##D #   0.73    0.05   75.71 
##D  
##D for (i in 1:8) 
##D     print(system.time(ip.secr (captdata, trace = FALSE, ncores = i)))
##D 
##D #   user  system elapsed 
##D # 132.59    0.00  132.58 
##D #   user  system elapsed 
##D #   0.25    0.05   71.08 
##D #   user  system elapsed 
##D #   0.20    0.04   50.76 
##D #   user  system elapsed 
##D #   0.32    0.07   42.13 
##D #   user  system elapsed 
##D #   0.26    0.09   41.74 
##D #   user  system elapsed 
##D #   0.39    0.08   39.01 
##D #   user  system elapsed 
##D #   0.25    0.09   36.52 
##D #   user  system elapsed 
##D #   0.46    0.08   35.91 
##D  
##D for (i in 1:8)
##D     print(system.time(LLsurface(secrdemo.0, ncores = i)))
##D     
##D #Evaluating log likelihood across grid of 121 points...
##D #   user  system elapsed 
##D #  48.00    0.40   48.41 
##D #Evaluating log likelihood across grid of 121 points...
##D #   user  system elapsed 
##D #   0.00    0.03   27.94 
##D #Evaluating log likelihood across grid of 121 points...
##D #   user  system elapsed 
##D #   0.00    0.03   20.60 
##D #Evaluating log likelihood across grid of 121 points...
##D #   user  system elapsed 
##D #   0.03    0.02   17.63 
##D #Evaluating log likelihood across grid of 121 points...
##D #   user  system elapsed 
##D #   0.01    0.05   16.41 
##D #Evaluating log likelihood across grid of 121 points...
##D #   user  system elapsed 
##D #   0.02    0.04   16.10 
##D #Evaluating log likelihood across grid of 121 points...
##D #   user  system elapsed 
##D #   0.05    0.03   16.03 
##D #Evaluating log likelihood across grid of 121 points...
##D #   user  system elapsed 
##D #   0.02    0.07   15.99 
##D 
## End(Not run)




