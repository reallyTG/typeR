library(DesignLibrary)


### Name: two_by_two_designer
### Title: Create a two-by-two factorial design
### Aliases: two_by_two_designer simple_factorial_designer

### ** Examples

design <- two_by_two_designer(outcome_means = c(0,0,0,1))

# A design biased for the specified estimands:
design <- two_by_two_designer(outcome_means = c(0,0,0,1), prob_A = .8, prob_B = .2)
## Not run: 
##D diagnose_design(design)
## End(Not run)

# A design with estimands that "match" the assignment:
design <- two_by_two_designer(outcome_means = c(0,0,0,1), 
                                    prob_A = .8, prob_B = .2, 
                                    weight_A = .8, weight_B = .2)
## Not run: 
##D diagnose_design(design)
## End(Not run)

# Compare power with and without interactions, given same average effects in each arm
designs <- redesign(two_by_two_designer(), 
                    outcome_means = list(c(0,0,0,1), c(0,.5,.5,1)))
## Not run: 
##D diagnose_design(designs)
## End(Not run)




