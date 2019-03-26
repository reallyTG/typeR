library(DesignLibrary)


### Name: process_tracing_designer
### Title: Create a process-tracing design
### Aliases: process_tracing_designer

### ** Examples

# Generate a process-tracing design using default arguments:
pt_1 <- process_tracing_designer()
draw_estimands(pt_1)
draw_estimates(pt_1)
draw_data(pt_1)
## Not run: 
##D diagnose_design(pt_1, sims = 1000)
## End(Not run)

# A design in which the smoking gun and straw-in-the-wind are correlated
pt_2 <- process_tracing_designer(cor_E1E2_H = .32)
## Not run: 
##D diagnose_design(pt_2, sims = 1000)
## End(Not run)

# A design with two doubly-decisive tests pointing in opposite directions
pt_3 <- process_tracing_designer(p_E1_H = .80,p_E1_not_H = .05,
                                 label_E1 = "Doubly-Decisive: H",
                                 p_E2_H = .05,p_E2_not_H = .80,
                                 label_E2 = "Doubly-Decisive: Not H")
draw_estimates(pt_3)                                
## Not run: 
##D diagnose_design(pt_3, sims = 1000)
## End(Not run)




