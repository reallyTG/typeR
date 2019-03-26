library(skpr)


### Name: eval_design
### Title: Calculate Power of an Experimental Design
### Aliases: eval_design

### ** Examples

#Generating a simple 2x3 factorial to feed into our optimal design generation
#of an 11-run design.
factorial = expand.grid(A = c(1, -1), B = c(1, -1), C = c(1, -1))

optdesign = gen_design(candidateset = factorial,
                      model= ~A + B + C, trials = 11, optimality = "D", repeats = 100)

#Now evaluating that design (with default anticipated coefficients and a effectsize of 2):
eval_design(design = optdesign, model= ~A + B + C, alpha = 0.2)

#Evaluating a subset of the design (which changes the power due to a different number of
#degrees of freedom)
eval_design(design = optdesign, model= ~A + C, alpha = 0.2)

#Halving the signal-to-noise ratio by setting a different effectsize (default is 2):
eval_design(design = optdesign, model= ~A + B + C, alpha = 0.2, effectsize = 1)

#With 3+ level categorical factors, the choice of anticipated coefficients directly changes the
#final power calculation. For the most conservative power calculation, that involves
#setting all anticipated coefficients in a factor to zero except for one. We can specify this
#option with the "conservative" argument.

factorialcoffee = expand.grid(cost = c(1, 2),
                              type = as.factor(c("Kona", "Colombian", "Ethiopian", "Sumatra")),
                              size = as.factor(c("Short", "Grande", "Venti")))

designcoffee = gen_design(factorialcoffee,
                         ~cost + size + type, trials = 29, optimality = "D", repeats = 100)

#Evaluate the design, with default anticipated coefficients (conservative is FALSE by default).
#(Setting detailedoutput = TRUE provides information on the anticipated
#coefficients that were used:)
eval_design(designcoffee, model = ~cost + size + type, alpha = 0.05, detailedoutput = TRUE)

#Evaluate the design, with conservative anticipated coefficients:
eval_design(designcoffee, model = ~cost + size + type, alpha = 0.05, detailedoutput = TRUE,
            conservative = TRUE)

#which is the same as the following, but now explicitly entering the coefficients:
eval_design(designcoffee, model = ~cost + size + type, alpha = 0.05,
            anticoef = c(1, 1, 1, 0, 0, 1, 0), detailedoutput = TRUE)


#If the defaults do not suit you, enter the anticipated coefficients in manually.
eval_design(designcoffee,
           model = ~cost + size + type, alpha = 0.05, anticoef = c(1, 1, 0, 0, 1, 0, 1))

#You can also evaluate the design with higher order effects, even if they were not
#used in design generation:
eval_design(designcoffee, model = ~cost + size + type + cost * type, alpha = 0.05)

#Split plot designs can also be evaluated by setting the blocking parameter as TRUE.

#Generating split plot design
splitfactorialcoffee = expand.grid(caffeine = c(1, -1),
                                  cost = c(1, 2),
                                  type = as.factor(c("Kona", "Colombian", "Ethiopian", "Sumatra")),
                                  size = as.factor(c("Short", "Grande", "Venti")))

coffeeblockdesign = gen_design(splitfactorialcoffee, ~caffeine, trials = 12)
coffeefinaldesign = gen_design(splitfactorialcoffee,
                              model = ~caffeine + cost + size + type, trials = 36,
                              splitplotdesign = coffeeblockdesign, splitplotsizes = 3)

#Evaluating design
eval_design(coffeefinaldesign, ~cost + size + type + caffeine, 0.2, blocking = TRUE)

#We can also evaluate the design with a custom ratio between the whole plot error to
#the run-to-run error.
eval_design(coffeefinaldesign, ~caffeine + cost + size + type + caffeine, 0.2, blocking = TRUE,
            varianceratios = 2)

#If the design was generated outside of skpr and thus the row names do not have the
#blocking structure encoded already, the user can add these manually. For a 12-run
#design with 4 blocks, the rownames will be as follows:

manualrownames = paste(c(1, 1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 4), rep(c(1, 2, 3), 4), sep = ".")

#If we wanted to add this blocking structure to the design coffeeblockdesign, we would
#simply set the rownames to this character vector:

rownames(coffeeblockdesign) = manualrownames

#Deeper levels of blocking can be specified with additional periods.



