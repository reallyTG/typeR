library(DeclareDesign)


### Name: print_code
### Title: Print code to recreate a design
### Aliases: print_code

### ** Examples


my_population <- declare_population(N = 100)

my_assignment <- declare_assignment(m = 50)

my_design <- my_population + my_assignment

print_code(my_design)




