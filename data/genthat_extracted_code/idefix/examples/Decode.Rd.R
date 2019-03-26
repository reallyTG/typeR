library(idefix)


### Name: Decode
### Title: Coded design to readable design.
### Aliases: Decode

### ** Examples

## No test: 
# Example without continuous attributes.
design <- example_design 
c <- c("D", "D", "D") # Coding.
# Levels as they should appear in survey. 
al <- list(
  c("$50", "$75", "$100"), # Levels attribute 1.
  c("2 min", "15 min", "30 min"), # Levels attribute 2.
  c("bad", "moderate", "good") # Levels attribute 3.
) 
# Decode
Decode(des = design, lvl.names = al, coding = c) 

# Example with alternative specific constants
design <- example_design2 
c <- c("D", "D", "D") # Coding.
# Levels as they should appear in survey. 
al <- list(
  c("$50", "$75", "$100"), # Levels attribute 1.
  c("2 min", "15 min", "30 min"), # Levels attribute 2.
  c("bad", "moderate", "good") # Levels attribute 3.
) 
# Decode
Decode(des = design, lvl.names = al, coding = c, alt.cte = c(1, 1, 0)) 
## End(No test)



