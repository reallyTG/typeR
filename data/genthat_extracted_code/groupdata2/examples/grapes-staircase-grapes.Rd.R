library(groupdata2)


### Name: %staircase%
### Title: Find remainder from staircase method.
### Aliases: %staircase% staircase

### ** Examples

# Attach packages
library(groupdata2)

100 %staircase% 2

# Finding remainder with value 0
size = 150
for (step_size in c(1:30)){
 if(size %staircase% step_size == 0){
   print(step_size)
 }}




