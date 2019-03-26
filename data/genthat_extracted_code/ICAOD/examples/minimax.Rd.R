library(ICAOD)


### Name: minimax
### Title: Minimax and Standardized Maximin D-Optimal Designs
### Aliases: minimax

### ** Examples

########################################
# Two-parameter exponential growth model
########################################
res1 <- minimax (formula = ~a + exp(-b*x), predvars = "x", parvars = c("a", "b"),
                 lx = 0, ux = 1, lp = c(1, 1), up = c(1, 10),
                 iter = 1, k = 4, ICA.control= ICA.control(rseed = 100))
# the optimal design has 3 points, but we set k = 4 for illustration purpose to
#   show how the algorithm modify the design by assigning weights and locating
#   the points.
## Not run: 
##D   res1 <- iterate(res1, 150)
##D   # iterating the algorithm up to 150 more iterations
## End(Not run)

res1 # print method
plot(res1) # veryfying the general equivalence theorem

## Not run: 
##D  ## fixed x
##D res1.1 <- minimax (formula = ~a + exp(-b*x), predvars = "x", parvars = c("a", "b"),
##D                  lx = 0, ux = 1, lp = c(1, 1), up = c(1, 10),
##D                  x = c(0, .5, 1),
##D                  iter = 150, k = 3, ICA.control= ICA.control(rseed = 100))
##D # not optimal
## End(Not run)

########################################
# Two-parameter logistic model.
########################################
# A little bit tickling with the tuning parameters
# reducing the value of maxeval to 200 to increase the speed
cont1 <- crt.minimax.control(optslist = list(maxeval = 500))
cont2 <- ICA.control(rseed = 100, checkfreq = Inf, ncount = 60)

## Not run: 
##D   res2 <- minimax (formula = ~1/(1 + exp(-b *(x - a))), predvars = "x",
##D                    parvars = c("a", "b"),
##D                    family = binomial(), lx = -3, ux = 3,
##D                    lp = c(0, 1), up = c(1, 2.5), iter = 200, k = 3,
##D                    ICA.control= cont2, crt.minimax.control = cont1)
##D   print(res2)
##D   plot(res2)
## End(Not run)

############################################
# An example of a model with two predictors
############################################
# Mixed inhibition model
lower <- c(1, 4, 2, 4)
upper <- c(1, 5, 3, 5)
cont <- crt.minimax.control(optslist = list(maxeval = 100)) # to be faster
## Not run: 
##D res3 <- minimax(formula =  ~ V*S/(Km * (1 + I/Kic)+ S * (1 + I/Kiu)),
##D                 predvars = c("S", "I"),
##D                 parvars = c("V", "Km", "Kic", "Kiu"),
##D                 lx = c(0, 0), ux = c(30, 60), k = 4,
##D                 iter = 100, lp = lower, up = upper,
##D                 ICA.control= list(rseed = 100),
##D                 crt.minimax.control = cont)
##D 
##D   res3 <- iterate(res3, 100)
##D   print(res3)
##D   plot(res3) # sensitivity plot
##D   res3$arg$time
## End(Not run)

# Now consider grid points instead of assuming continuous parameter space
# set n.grid to 5
## Not run: 
##D   res4 <- minimax(formula =  ~ V*S/(Km * (1 + I/Kic)+ S * (1 + I/Kiu)),
##D                   predvars = c("S", "I"),
##D                   parvars = c("V", "Km", "Kic", "Kiu"),
##D                   lx = c(0, 0), ux = c(30, 60),
##D                   k = 4, iter = 130, n.grid = 5, lp = lower, up = upper,
##D                   ICA.control= list(rseed = 100, checkfreq = Inf),
##D                   crt.minimax.control = cont)
##D   print(res4)
##D   plot(res4) # sensitivity plot
## End(Not run)

############################################
# Standardized maximin D-optimal designs
############################################
# Now assume the purpose is finding STANDARDIZED designs
# We know from the literature that the locally D-optimal design (LDOD)
# for this model has analytical solution.
# The follwoing function takes the parameter as input and returns
# the design points and weights of LDOD.
# x and w are exactly similar to the arguments of 'fimfunc'.
# x is a vector and returns the design points 'dimension-wise'.
# see explanation of the arguments of 'fimfunc' in 'Details'.

LDOD <- function(V, Km, Kic, Kiu){
  #first dimention is for S and the second one is for I.
  S_min <- 0
  S_max <- 30
  I_min <- 0
  I_max <- 60
  s2 <- max(S_min, S_max*Km*Kiu*(Kic+I_min)/
              (S_max*Kic*I_min+S_max*Kic*Kiu+2*Km*Kiu*I_min+2*Km*Kiu*Kic))
  i3 <- min((2*S_max*Kic*I_min + S_max*Kic*Kiu+2*Km*Kiu*I_min+Km*Kiu*Kic)/
              (Km*Kiu+S_max*Kic), I_max)
  i4 <- min(I_min + (sqrt((Kic+I_min)*(Km*Kic*Kiu+Km*Kiu*I_min+
                                         S_max*Kic*Kiu+S_max*Kic*I_min)/
                            (Km*Kiu+S_max*Kic))), I_max )
  s4 <- max(-Km*Kiu*(Kic+2*I_min-i4)/(Kic*(Kiu+2*I_min-i4)), S_min)
  x <- c(S_max, s2, S_max, s4, I_min, I_min, i3, i4)
  return(list(x = x, w =rep(1/4, 4)))

}
formalArgs(LDOD)
## Not run: 
##D   minimax(formula =  ~ V*S/(Km * (1 + I/Kic)+ S * (1 + I/Kiu)),
##D           predvars = c("S", "I"),
##D           parvars = c("V", "Km", "Kic", "Kiu"),
##D           lx = c(0, 0), ux = c(30, 60),
##D           k = 4, iter = 300,
##D           lp = lower, up = upper,
##D           ICA.control= list(rseed = 100, checkfreq = Inf),
##D           crt.minimax.control = cont,
##D           standardized = TRUE,
##D           localdes = LDOD)
## End(Not run)


################################################################
# Not necessary!
# The rest of the examples here are only for professional uses.
################################################################
# Imagine you have written your own FIM, say in Rcpp that is faster than
# the FIM created by the formula interface above.

###########################################
# An example of a model with two predictors
###########################################
# For example, th cpp FIM function for the mixed inhibition model is named:
formalArgs(FIM_mixed_inhibition)

# We should reparamterize the arguments to match the standard of the
# argument 'fimfunc' (see 'Details').
myfim <- function(x, w, param){
  npoint <- length(x)/2
  S <- x[1:npoint]
  I <- x[(npoint+1):(npoint*2)]
  out <- FIM_mixed_inhibition(S = S, I = I, w = w, param = param)
  return(out)
}
formalArgs(myfim)

# Finds minimax optimal design, exactly as before, but NOT using the
# formula interface.
## Not run: 
##D   res5 <- minimax(fimfunc = myfim,
##D                   lx = c(0, 0), ux = c(30, 60), k = 4,
##D                   iter = 100, lp = lower, up = upper,
##D                   ICA.control= list(rseed = 100),
##D                   crt.minimax.control = cont)
##D   print(res5)
##D   plot(res5) # sensitivity plot
## End(Not run)
#########################################
# Standardized maximin D-optimal designs
#########################################
# To match the argument 'localdes' when no formula inteface is used,
# we should reparameterize LDOD.
# The input must be 'param' same as the argument of 'fimfunc'
LDOD2 <- function(param)
  LDOD(V = param[1], Km = param[2], Kic = param[3], Kiu = param[4])

# compare these two:
formalArgs(LDOD)
formalArgs(LDOD2)
## Not run: 
##D   res6 <- minimax(fimfunc = myfim,
##D                   lx = c(0, 0), ux = c(30, 60), k = 4,
##D                   iter = 300, lp = lower, up = upper,
##D                   ICA.control= list(rseed = 100, checkfreq = Inf),
##D                   crt.minimax.control = cont,
##D                   standardized = TRUE,
##D                   localdes = LDOD2)
##D   res6
##D   plot(res6)
## End(Not run)




