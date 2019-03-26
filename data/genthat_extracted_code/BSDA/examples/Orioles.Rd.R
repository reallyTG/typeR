library(BSDA)


### Name: Orioles
### Title: Salaries of members of the Baltimore Orioles baseball team
### Aliases: Orioles
### Keywords: datasets

### ** Examples


stripchart(Orioles$`1999salary`, method = "stack", pch = 19)
## Not run: 
##D library(ggplot2)
##D ggplot2::ggplot(data = Orioles, aes(x = `1999salary`)) + 
##D            geom_dotplot(dotsize = 0.5) + 
##D            labs(x = "1999 Salary") +
##D            theme_bw()
## End(Not run)




