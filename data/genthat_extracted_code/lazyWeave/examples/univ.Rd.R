library(lazyWeave)


### Name: univ
### Title: Univariable Table
### Aliases: univ

### ** Examples

data(Delivery)
#Read in the delivery dataset from the CCFmisc library
#use labelVector package to label variables in univariate tables
Delivery$maternal.age <- 
  labelVector::set_label(Delivery$maternal.age, "Maternal Age")
Delivery$ga.weeks <- 
  labelVector::set_label(Delivery$ga.weeks, "Gestation weeks")
Delivery$wt.gram <- 
  labelVector::set_label(Delivery$wt.gram, "Weight (g)")


#a univariate table of the variables maternal age,
#ga.weeks and wt.grams.  The object resulting
#from univ() can be used in other functions to create html or
#LaTeX tables.

uni <- univ(Delivery,
            vars=c("maternal.age", "ga.weeks", "wt.gram"))

#a univariate table of the variables maternal age,
#ga.weeks and wt.grams by delivery.type.  The object resulting
#from univ() can be used in other functions to create html or
#LaTeX tables.

deliv.uni <- univ(Delivery,
                  vars=c("maternal.age", "ga.weeks", "wt.gram"),
                  byVar="delivery.type")

#if you want to take advantage of the confidence interval
#output from univ() different alpha levels can be set
#by the alpha= argument.

deliv_99.uni <- univ(Delivery,
                     vars=c("maternal.age", "ga.weeks", "wt.gram"),
                     byVar="delivery.type",
                     alpha=0.01)




