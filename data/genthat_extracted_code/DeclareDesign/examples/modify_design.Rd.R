library(DeclareDesign)


### Name: modify_design
### Title: Modify a design after the fact
### Aliases: modify_design insert_step delete_step replace_step

### ** Examples


 my_population <- declare_population(N = 100, noise = rnorm(N), label = "my_pop")

 my_potential_outcomes <-
   declare_potential_outcomes(Y_Z_0 = noise,
                              Y_Z_1 = noise + rnorm(N, mean = 2, sd = 2))

 my_assignment <- declare_assignment(m = 50)
 my_assignment_2 <- declare_assignment(m = 25)

 design <- my_population + my_potential_outcomes + my_assignment

 design

 insert_step(design, declare_step(dplyr::mutate, income = noise^2), after = my_assignment)
 insert_step(design, declare_step(dplyr::mutate, income = noise^2), before = my_assignment)

 # If you are using a design created by a designer, for example from
 #   the DesignLibrary package, you will not have access to the step
 #   objects. Instead, you can always use the label of the step.
 
 # get the labels for the steps
 names(design)
 
 insert_step(design, declare_sampling(n = 50), after = "my_pop")


 delete_step(design, my_assignment)
 replace_step(design, my_assignment, declare_step(dplyr::mutate, words = "income"))



