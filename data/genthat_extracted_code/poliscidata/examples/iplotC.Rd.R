library(poliscidata)


### Name: iplotC
### Title: Interaction plot
### Aliases: iplotC

### ** Examples

   library(poliscidata)
   
   iplotC(function1 = ~ ft_dem, function2 = ~ gender + married, 
          data = nesD, function3 = ft_dem ~ married + gender)
   
   iplotC(~ft_dem, ~gender+married, nesD, ft_dem~married+gender,
          xlab="Gender", ylab="Democratic Party Rating", 
          main="Democratic Party Rating by Gender and Marital Status")



