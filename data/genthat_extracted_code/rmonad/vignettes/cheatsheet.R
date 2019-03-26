## ---- eval=FALSE---------------------------------------------------------
#  library(rmonad)
#  
#  letters[1:5] %>>% paste(collapse="")
#  letters[1:5] %v>% paste(collapse="")
#  rnorm(1) %>_%
#    { stopifnot(. > 0 & . < 1) } %>>%
#    { rbinom(n=10, size=5, prob=.) }
#  
#  rnorm(1) %>^%
#    {
#  
#        "This is a seperate branch, it fails if '.' is not between 0 and 1"
#  
#        . %>_%
#          { stopifnot(. > 0 & . < 1) } %>>%
#          { rbinom(n=10, size=5, prob=.) }
#    } %>>%
#    {
#  
#        "This will run even if the branch producing the binomial random
#        variables fails. It never fails."
#  
#        rnorm(n=10, mean=.,sd=1)
#    }

