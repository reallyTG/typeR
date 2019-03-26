library(BSDA)


### Name: Domestic
### Title: Rates of domestic violence per 1,000 women by age groups
### Aliases: Domestic
### Keywords: datasets

### ** Examples


barplot(Domestic$rate, names.arg = Domestic$age)
## Not run: 
##D library(ggplot2)
##D ggplot2::ggplot(data = Domestic, aes(x = age, y = rate)) + 
##D            geom_bar(stat = "identity", fill = "purple", color = "black") + 
##D            labs(x = "", y = "Domestic violence per 1000 women") + 
##D            theme_bw()
## End(Not run)



