library(EvCombR)


### Name: upper
### Title: Upper Bounds Based on Evidence Structure
### Aliases: upper

### ** Examples

# state space
stateSpace <- c("a", "b", "c")

# mass function
m <- mass(list("a"=0.1, "b"=0.1 , 
               "c"=0.4, "a/b/c"=0.4), stateSpace)

# credal set
c <- credal(c(0.1, 0.1, 0.1), 
            c(0.8, 0.8, 0.8), stateSpace)

# calculate upper bounds
upper(m, c("a", "a/b"))
upper(c, c("a", "a/b")) 

# upper bounds on singletons
upper(m)




