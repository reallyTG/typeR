library(DAISIE)


### Name: DAISIE_ML
### Title: Maximization of the loglikelihood under the DAISIE model
### Aliases: DAISIE_ML
### Keywords: models

### ** Examples

cat("
### When all species have the same rates, and we want to optimize all 5 parameters,
# we use:

data(Galapagos_datalist)
DAISIE_ML(
   datalist = Galapagos_datalist,
   initparsopt = c(2.5,2.7,20,0.009,1.01),
   ddmodel = 11,
   idparsopt = 1:5,
   parsfix = NULL,
   idparsfix = NULL
)

### When all species have the same rates, and we want to optimize all parameters 
# except K (which we set equal to Inf), we use:

data(Galapagos_datalist)
DAISIE_ML(
   datalist = Galapagos_datalist,
   initparsopt = c(2.5,2.7,0.009,1.01),
   idparsopt = c(1,2,4,5),
   parsfix = Inf,
   idparsfix = 3
   )

### When all species have the same rates except that the finches have a different
# rate of cladogenesis, and we want to optimize all parameters except K (which we
# set equal to Inf), fixing the proportion of finch-type species at 0.163, we use:

data(Galapagos_datalist_2types)
DAISIE_ML(
   datalist = Galapagos_datalist_2types,
   initparsopt = c(0.38,0.55,0.004,1.1,2.28),
   idparsopt = c(1,2,4,5,6),
   parsfix = c(Inf,Inf,0.163),
   idparsfix = c(3,8,11),
   idparsnoshift = c(7,9,10)
   )

### When all species have the same rates except that the finches have a different
# rate of cladogenesis, extinction and a different K, and we want to optimize all
# parameters, fixing the proportion of finch-type species at 0.163, we use:

data(Galapagos_datalist_2types)
DAISIE_ML(
   datalist = Galapagos_datalist_2types,
   ddmodel = 11,   
   initparsopt = c(0.19,0.09,0.002,0.87,20,8.9,15),
   idparsopt = c(1,2,4,5,6,7,8),
   parsfix = c(Inf,0.163),
   idparsfix = c(3,11),
   idparsnoshift = c(9,10)
   )


### When all species have the same rates except that the finches have a different
# rate of extinction, and we want to optimize all parameters except K (which we 
# set equal to Inf), and we also# want to estimate the fraction of finch species
# in the mainland pool. we use:

data(Galapagos_datalist_2types)
DAISIE_ML(
   datalist = Galapagos_datalist_2types,
   initparsopt = c(2.48,2.7,0.009,1.01,2.25,0.163),
   idparsopt = c(1,2,4,5,7,11),
   parsfix = c(Inf,Inf),
   idparsfix = c(3,8),
   idparsnoshift = c(6,9,10)
   )

### When we have two islands with the same rates except for immigration and anagenesis rate,
# and we want to optimize all parameters, we use:

data(Galapagos_datalist)
DAISIE_ML(
   datalist = list(Galapagos_datalist,Galapagos_datalist),
   datatype = 'multiple',
   initparsopt = c(2.5,2.7,20,0.009,1.01,0.009,1.01),
   idparsmat = rbind(1:5,c(1:3,6,7)),
   idparsopt = 1:7,
   parsfix = NULL,
   idparsfix = NULL
)

### When we consider the four Macaronesia archipelagoes and set all parameters the same
# except for rates of cladogenesis, extinction and immigration for Canary Islands,
# rate of cladogenesis is fixed to 0 for the other archipelagoes,
# diversity-dependence is assumed to be absent
# and we want to optimize all parameters, we use:

data(Macaronesia_datalist)
DAISIE_ML(
   datalist = Macaronesia_datalist,
   datatype = 'multiple',
   initparsopt = c(1.053151832,0.052148979,0.512939011,0.133766934,0.152763179),
   idparsmat = rbind(1:5,c(6,2,3,7,5),1:5,1:5),
   idparsopt = c(2,4,5,6,7),
   parsfix = c(0,Inf),
   idparsfix = c(1,3)
)
   
")



