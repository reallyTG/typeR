library(DeclareDesign)


### Name: declare_assignment
### Title: Declare assignment procedure
### Aliases: declare_assignment assignment_handler

### ** Examples


# Default handler delegates to conduct_ra

# Declare assignment of m units to treatment
my_assignment <- declare_assignment(m = 50)

# Declare assignment specifying assignment probability for each block
my_assignment <- declare_assignment(block_prob = c(1/3, 2/3), blocks = female)

# Declare assignment of clusters with probability 1/4
my_assignment <- declare_assignment(
  prob = 1/4,
  clusters = classrooms,
  assignment_variable = "X1"
)
 
# Declare factorial assignment (Approach 1): 
#   Use complete random assignment to assign T1 and then use T1 as a block to assign T2. 
 design <- declare_population(N = 4) + 
   declare_assignment(assignment_variable = "T1") + 
   declare_assignment(blocks = T1, assignment_variable = "T2")
   draw_data(design)
   
# Declare factorial assignment (Approach 2): 
#   Assign to four conditions and then split into separate factors. 
 design <- declare_population(N = 4) + 
   declare_assignment(conditions = 1:4) + 
   declare_step(fabricate, T1 = as.numeric(Z %in% 2:3), T2 = as.numeric(Z %in% 3:4))
   draw_data(design)
   
# Declare assignment using custom handler

custom_assignment <- function(data, assignment_variable = "X") {
 data[, assignment_variable] <- rbinom(n = nrow(data),
                                       size = 1,
                                       prob = 0.5)
 data
 }
 
 declare_population(N = 6) + 
   declare_assignment(handler = custom_assignment, assignment_variable = "X")
   



