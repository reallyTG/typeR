library(expss)


### Name: write_labels
### Title: Write data with labels to file in R code or in SPSS syntax.
### Aliases: write_labels read_labelled_csv read_labelled_csv2
###   read_labelled_tab read_labelled_tab2 write_labelled_csv
###   write_labelled_csv2 write_labelled_tab write_labelled_tab2
###   write_labelled_spss write_labels_spss

### ** Examples

## Not run: 
##D data(mtcars)
##D mtcars = modify(mtcars,{
##D                 var_lab(mpg) = "Miles/(US) gallon"
##D                 var_lab(cyl) = "Number of cylinders"
##D                 var_lab(disp) = "Displacement (cu.in.)"
##D                 var_lab(hp) = "Gross horsepower"
##D                 var_lab(drat) = "Rear axle ratio"
##D                 var_lab(wt) = "Weight (lb/1000)"
##D                 var_lab(qsec) = "1/4 mile time"
##D                 var_lab(vs) = "Engine"
##D                 val_lab(vs) = c("V-engine" = 0, 
##D                                 "Straight engine" = 1) 
##D                 var_lab(am) = "Transmission"
##D                 val_lab(am) = c(automatic = 0, 
##D                                 manual=1)
##D                 var_lab(gear) = "Number of forward gears"
##D                 var_lab(carb) = "Number of carburetors"
##D })
##D 
##D # to R code
##D # rownames are not preserved
##D write_labelled_csv(mtcars, "mtcars.csv")
##D new_mtcars = read_labelled_csv("mtcars.csv")
##D 
##D # to SPSS syntax
##D write_labelled_spss(mtcars, "mtcars.csv")
##D 
## End(Not run)



