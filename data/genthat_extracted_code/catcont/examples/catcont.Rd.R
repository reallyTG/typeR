library(catcont)


### Name: cat_cont
### Title: categorical or continuous variables
### Aliases: cat_cont is_cat is_cont is_cat.default is_cat.ordered
###   is_cat.factor is_cat.logical is_cont.default is_cont.logical
###   is_cont.factor is_cont.ordered which_cat which_cont

### ** Examples


  data(iris)
  cat_cont(iris)


  is_cat(letters)          # TRUE
  is_cat(factor(letters))  # TRUE
  is_cat(TRUE)             # TRUE
  is_cat(FALSE)            # TRUE
  is_cat(1:10)             # FALSE
  is_cat(rnorm(10))        # FALSE
  is_cat( Sys.Date() )     # FALSE
  is_cat( complex(1,2) )   # FALSE

  is_cont(letters)         # FALSE
  is_cont(factor(letters)) # FALSE
  is_cont(TRUE)            # FALSE
  is_cont(FALSE)           # FALSE
  is_cont(1:10)            # TRUE
  is_cont(rnorm(10))       # TRUE
  is_cont( Sys.Date() )    # TRUE
  is_cont( complex(1,2) )  # TRUE

  which_cat(iris)
  which_cat( iris, names=TRUE )

  which_cont(iris)
  which_cont( iris, names=TRUE )




