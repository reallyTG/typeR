library(equSA)


### Name: Cont2Gaus
### Title: A transfomation from count data into Gaussian data
### Aliases: Cont2Gaus
### Keywords: Cont2Gaus

### ** Examples

      ## Don't show: 
            library(equSA)
            data(count)
            subset <- count[1:5,1:10]
            Cont2Gaus(subset,total_iteration=10)
      
## End(Don't show)
      ## No test: 
           library(equSA)
           data(count)
           Cont2Gaus(count,total_iteration=1000)
      
## End(No test)



