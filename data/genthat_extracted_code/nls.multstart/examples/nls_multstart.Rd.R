library(nls.multstart)


### Name: nls_multstart
### Title: Finds the best fit of non-linear model based on AIC score
### Aliases: nls_multstart

### ** Examples

# load in data

data("Chlorella_TRC")
Chlorella_TRC_test <- Chlorella_TRC[Chlorella_TRC$curve_id == 1,]

# run nls_multstart()

# define the Sharpe-Schoolfield equation
schoolfield_high <- function(lnc, E, Eh, Th, temp, Tc) {
 Tc <- 273.15 + Tc
 k <- 8.62e-5
 boltzmann.term <- lnc + log(exp(E/k*(1/Tc - 1/temp)))
 inactivation.term <- log(1/(1 + exp(Eh/k*(1/Th - 1/temp))))
 return(boltzmann.term + inactivation.term)
}

fits <- nls_multstart(ln.rate ~ schoolfield_high(lnc, E, Eh, Th, temp = K, Tc = 20),
                data = Chlorella_TRC_test,
                iter = 500,
                start_lower = c(lnc=-10, E=0.1, Eh=0.5, Th=285),
                start_upper = c(lnc=10, E=2, Eh=5, Th=330),
                lower = c(lnc=-10, E=0, Eh=0, Th=0),
                supp_errors = 'Y')




