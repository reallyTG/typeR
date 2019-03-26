library(skpr)


### Name: eval_design_mc
### Title: Monte Carlo Power Evaluation for Experimental Designs
### Aliases: eval_design_mc

### ** Examples

#We first generate a full factorial design using expand.grid:
factorialcoffee = expand.grid(cost = c(-1, 1),
                              type = as.factor(c("Kona", "Colombian", "Ethiopian", "Sumatra")),
                              size = as.factor(c("Short", "Grande", "Venti")))

#And then generate the 21-run D-optimal design using gen_design.

designcoffee = gen_design(factorialcoffee,
                         model = ~cost + type + size, trials = 21, optimality = "D")

#To evaluate this design using a normal approximation, we just use eval_design
#(here using the default settings for contrasts, effectsize, and the anticipated coefficients):

eval_design(design = designcoffee, model = ~cost + type + size, 0.05)

#To evaluate this design with a Monte Carlo method, we enter the same information
#used in eval_design, with the addition of the number of simulations "nsim" and the distribution
#family used in fitting for the glm "glmfamily". For gaussian, binomial, exponential, and poisson
#families, a default random generating function (rfunction) will be supplied. If another glm
#family is used or the default random generating function is not adequate, a custom generating
#function can be supplied by the user.

## Not run: 
##D eval_design_mc(designcoffee, model = ~cost + type + size, alpha = 0.05, nsim = 100,
##D                        glmfamily = "gaussian")
## End(Not run)

#We see here we generate approximately the same parameter powers as we do
#using the normal approximation in eval_design. Like eval_design, we can also change
#effectsize to produce a different signal-to-noise ratio:

## Not run: 
##D eval_design_mc(design = designcoffee, model = ~cost + type + size, alpha = 0.05,
##D               nsim = 100, glmfamily = "gaussian", effectsize = 1)
## End(Not run)

#Like eval_design, we can also evaluate the design with a different model than
#the one that generated the design.
## Not run: 
##D eval_design_mc(design = designcoffee, model = ~cost + type, alpha = 0.05,
##D               nsim = 100, glmfamily = "gaussian")
## End(Not run)


#And here it is evaluated with interactions included:
## Not run: 
##D eval_design_mc(design = designcoffee, model = ~cost + type + size + cost * type, 0.05,
##D               nsim = 100, glmfamily = "gaussian")
## End(Not run)

#We can also set "parallel = TRUE" to use all the cores available to speed up
#computation.
## Not run: 
##D eval_design_mc(design = designcoffee, model = ~cost + type + size, 0.05,
##D               nsim = 10000, glmfamily = "gaussian", parallel = TRUE)
## End(Not run)

#We can also evaluate split-plot designs. First, let us generate the split-plot design:

factorialcoffee2 = expand.grid(Temp = c(1, -1),
                               Store = as.factor(c("A", "B")),
                               cost = c(-1, 1),
                               type = as.factor(c("Kona", "Colombian", "Ethiopian", "Sumatra")),
                               size = as.factor(c("Short", "Grande", "Venti")))

vhtcdesign = gen_design(factorialcoffee2,
                       model = ~Store, trials = 6, varianceratio = 1)
htcdesign = gen_design(factorialcoffee2, model = ~Store + Temp, trials = 18,
                       splitplotdesign = vhtcdesign, splitplotsizes = rep(3, 6), varianceratio = 1)
splitplotdesign = gen_design(factorialcoffee2,
                            model = ~Store + Temp + cost + type + size, trials = 54,
                            splitplotdesign = htcdesign, splitplotsizes = rep(3, 18),
                            varianceratio = 1)

#Each block has an additional noise term associated with it in addition to the normal error
#term in the model. This is specified by a vector specifying the additional variance for
#each split-plot level. This is equivalent to specifying a variance ratio of one between
#the whole plots and the sub-plots for gaussian models.

#Evaluate the design. Note the decreased power for the blocking factors.
## Not run: 
##D eval_design_mc(splitplotdesign, model = ~Store + Temp + cost + type + size, alpha = 0.05,
##D               blocking = TRUE, nsim = 100, glmfamily = "gaussian", varianceratios = c(1, 1))
## End(Not run)

#We can also use this method to evaluate designs that cannot be easily
#evaluated using normal approximations. Here, we evaluate a design with a binomial response and see
#whether we can detect the difference between each factor changing whether an event occurs
#70% of the time or 90% of the time.

factorialbinom = expand.grid(a = c(-1, 1), b = c(-1, 1))
designbinom = gen_design(factorialbinom, model = ~a + b, trials = 90, optimality = "D")

## Not run: 
##D eval_design_mc(designbinom, ~a + b, alpha = 0.2, nsim = 100, effectsize = c(0.7, 0.9),
##D               glmfamily = "binomial")
## End(Not run)

#We can also use this method to determine power for poisson response variables.
#Generate the design:

factorialpois = expand.grid(a = as.numeric(c(-1, 0, 1)), b = c(-1, 0, 1))
designpois = gen_design(factorialpois, ~a + b, trials = 70, optimality = "D")

#Evaluate the power:

## Not run: 
##D eval_design_mc(designpois, ~a + b, 0.05, nsim = 100, glmfamily = "poisson",
##D                anticoef = log(c(0.2, 2, 2)))
## End(Not run)


#The coefficients above set the nominal value -- that is, the expected count
#when all inputs = 0 -- to 0.2 (from the intercept), and say that each factor
#changes this count by a factor of 4 (multiplied by 2 when x= +1, and divided by 2 when x = -1).
#Note the use of log() in the anticipated coefficients.



