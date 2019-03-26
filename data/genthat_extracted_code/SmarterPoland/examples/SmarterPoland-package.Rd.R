library(SmarterPoland)


### Name: SmarterPoland-package
### Title: Tools for Accessing Various Datasets Developed by the Foundation
###   SmarterPoland.pl
### Aliases: SmarterPoland-package SmarterPoland
### Keywords: package

### ** Examples

## Not run: 
##D  # download the dataset 'Pupil/Student - teacher ratio and average class' from eurostat
##D  # for more developed API see https://github.com/rOpenGov/eurostat
##D  tmp <- getEurostatRCV(kod = "educ_iste")
##D  head(tmp)
##D  
##D  # download the dataset 'People killed in road accidents' from eurostat
##D  # and plot a maptable for selected countries
##D  # for more developed API see https://github.com/rOpenGov/eurostat
##D  library(ggplot2)
##D  t1 <- getEurostatRCV("tsdtr420")
##D  t1 <- t1[t1$geo ##D 
##D  ggplot(t1, aes(time, value, color=sex, group=sex)) + 
##D  	geom_line() + facet_wrap(~geo)
## End(Not run)



