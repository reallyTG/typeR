library(poliscidata)


### Name: plotmeansC
### Title: Plots mean comparison
### Aliases: plotmeansC

### ** Examples

   library(poliscidata)
   
   plotmeansC(nesD, ~ft_hclinton, ~pid_x, ft_hclinton~pid_x, 
   xlab="Party Identification", ylab="Ratings of Hillary Clinton", 
   main="Ratings of Hillary Clinton by Party Identification")
   
   plotmeansC(nes,~envir,~pid_3,envir~pid_3,w=~wt,
   xlab="Party Identification",
   ylab="Percent Pro-Environment",
   main="Percentage Favoring Environment over Jobs,\n by Party ID")
   



