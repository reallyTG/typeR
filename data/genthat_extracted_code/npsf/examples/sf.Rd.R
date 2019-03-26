library(npsf)


### Name: sf
### Title: Stochastic Frontier Models Using Cross-Sectional and Panel Data
### Aliases: sf
### Keywords: Stochastic Frontier Analysis Panel Data Models Panel Data
###   Analysis Heteroskedasticity Truncated normal Half normal Parametric
###   efficiency analysis summary

### ** Examples
 
require( npsf )

# Cross-sectional examples begin ------------------------------------------

# Load Penn World Tables 5.6 dataset

data( pwt56 )
head( pwt56 )

# Create some missing values

pwt56 [4, "K"] <- NA 

# Stochastic production frontier model with 
# homoskedastic error components (half-normal)

# Use subset of observations - for year 1965

m1 <- sf(log(Y) ~ log(L) + log(K), data = pwt56, 
         subset = year == 1965, distribution = "h")

# Test CRS: 'car' package in required for that
## Not run: linearHypothesis(m1, "log(L) + log(K) = 1")

# Write efficiencies to the data frame using 'esample':

pwt56$BC[ m1$esample ] <- m1$efficiencies$BC
## Not run: View(pwt56)

# Computation using matrices

Y1 <- as.matrix(log(pwt56[pwt56$year == 1965, 
                          c("Y"), drop = FALSE]))
X1 <- as.matrix(log(pwt56[pwt56$year == 1965,
                          c("K", "L"), drop = FALSE]))

X1 [51, 2] <- NA # create missing
X1 [49, 1] <- NA # create missing

m2 <- sf(Y1 ~ X1, distribution = "h")

# Load U.S. commercial banks dataset

data(banks05)
head(banks05)

# Doubly heteroskedastic stochastic cost frontier 
# model (truncated normal)

# Print summaries of cost efficiencies' estimates

m3 <- sf(lnC ~ lnw1 + lnw2 + lny1 + lny2, ln.var.u.0i = ~ ER, 
         ln.var.v.0i = ~ LA, data = banks05, distribution = "t", 
         prod = FALSE, print.level = 3)

# Non-monotonic marginal effects of equity ratio on 
# the mean of distribution of inefficiency term

m4 <- sf(lnC ~ lnw1 + lnw2 + lny1 + lny2, ln.var.u.0i = ~ ER,
         mean.u.0i = ~ ER, data = banks05, distribution = "t", 
         prod = FALSE, marg.eff = TRUE)

summary(m4$marg.effects)


# Cross-sectional examples end --------------------------------------------

## Not run: 
##D 
##D # Panel data examples begin -----------------------------------------------
##D 
##D # The only way to differentiate between cross-sectional and panel-data
##D # models is by specifying "it".
##D # If "it" is not specified, cross-sectional model will be estimated.
##D # Example is below.
##D 
##D # Read data ---------------------------------------------------------------
##D 
##D # Load U.S. commercial banks dataset
##D 
##D data(banks00_07)
##D head(banks00_07, 5)
##D 
##D banks00_07$trend <- banks00_07$year - min(banks00_07$year) + 1
##D 
##D # Model specification -----------------------------------------------------
##D 
##D my.prod     <- FALSE
##D my.it       <- c("id","year")
##D 
##D # my.model = "BC1992"
##D # my.model = "K1990modified"
##D # my.model = "K1990"
##D 
##D # translog ----------------------------------------------------------------
##D formu <- log(TC) ~ (log(Y1) + log(Y2) + log(W1) + log(W2) + trend)^2 +
##D  I(log(Y1)^2) + I(log(Y2)^2) + I(log(W1)^2) + I(log(W2)^2) +
##D  trend + I(trend^2)
##D 
##D # Cobb-Douglas ------------------------------------------------------------
##D # formu <- log(TC) ~ log(Y1) + log(Y2) + log(W1) + log(W2) + trend + I(trend^2)
##D 
##D ols <- lm(formu, data = banks00_07)
##D # just to mark the results of the OLS model
##D summary(ols)
##D 
##D # Components specifications -----------------------------------------------
##D 
##D ln.var.v.it <- ~ log(TA)
##D ln.var.u.0i <- ~ ER_ave
##D mean.u.0i_1 <- ~ LLP_ave + LA_ave
##D mean.u.0i_2 <- ~ LLP_ave + LA_ave - 1
##D 
##D # Suppose "it" is not specified
##D # Then it is a cross-sectional model
##D 
##D t0_1st_0 <- sf(formu, data = banks00_07, subset = year > 2000,
##D                prod = my.prod,
##D                ln.var.v.it = ln.var.v.it,
##D                ln.var.u.0i = ln.var.u.0i,
##D                eff.time.invariant = TRUE,
##D                mean.u.0i.zero = TRUE)
##D 
##D # 1st generation models ---------------------------------------------------
##D 
##D # normal-half normal ------------------------------------------------------
##D 
##D # the same as above but "it" is specified
##D 
##D t0_1st_0 <- sf(formu, data = banks00_07, it = my.it, subset = year > 2000,
##D                prod = my.prod,
##D                ln.var.v.it = ln.var.v.it,
##D                ln.var.u.0i = ln.var.u.0i, 
##D                eff.time.invariant = TRUE, 
##D                mean.u.0i.zero = TRUE)
##D 
##D 
##D 
##D # Note efficiencies are time-invariant
##D 
##D # normal-truncated normal -------------------------------------------------
##D 
##D # truncation point is constant (for all ids) ------------------------------
##D 
##D t0_1st_1 <- sf(formu, data = banks00_07, it = my.it, subset = year > 2000,
##D                prod = my.prod,
##D                eff.time.invariant = TRUE,
##D                mean.u.0i.zero = FALSE,
##D                ln.var.v.it = ln.var.v.it,
##D                ln.var.u.0i = ln.var.u.0i,
##D                mean.u.0i = NULL,
##D                cost.eff.less.one = TRUE)
##D 
##D 
##D 
##D # truncation point is determined by variables -----------------------------
##D 
##D t0_1st_2 <- sf(formu, data = banks00_07, it = my.it, subset = year > 2000,
##D                prod = my.prod,
##D                eff.time.invariant = TRUE,
##D                mean.u.0i.zero = FALSE,
##D                mean.u.0i = mean.u.0i_1,
##D                ln.var.v.it = ln.var.v.it,
##D                ln.var.u.0i = ln.var.u.0i,
##D                cost.eff.less.one = TRUE)
##D 
##D 
##D 
##D # the same, but without intercept in mean.u.0i
##D 
##D t0_1st_3 <- sf(formu, data = banks00_07, it = my.it, subset = year > 2000,
##D                prod = my.prod,
##D                eff.time.invariant = TRUE,
##D                mean.u.0i.zero = FALSE,
##D                mean.u.0i = mean.u.0i_2,
##D                ln.var.v.it = ln.var.v.it,
##D                ln.var.u.0i = ln.var.u.0i,
##D                cost.eff.less.one = TRUE)
##D 
##D # 2nd generation models ---------------------------------------------------
##D 
##D # normal-half normal ------------------------------------------------------
##D 
##D # Kumbhakar (1990) model --------------------------------------------------
##D 
##D t_nhn_K1990 <- sf(formu, data = banks00_07, it = my.it, subset = year > 2000,
##D                   prod = my.prod,
##D                   eff.time.invariant = FALSE,
##D                   mean.u.0i.zero = TRUE, 
##D                   ln.var.v.it = ln.var.v.it,
##D                   ln.var.u.0i = ln.var.u.0i, 
##D                   cost.eff.less.one = FALSE)
##D 
##D 
##D # Kumbhakar (1990) modified model -----------------------------------------
##D 
##D t_nhn_K1990modified <- sf(formu, data = banks00_07, it = my.it, subset = year > 2000,
##D                           prod = my.prod, model = "K1990modified",
##D                           eff.time.invariant = FALSE,
##D                           mean.u.0i.zero = TRUE, 
##D                           ln.var.v.it = ln.var.v.it,
##D                           ln.var.u.0i = ln.var.u.0i, 
##D                           cost.eff.less.one = FALSE)
##D 
##D 
##D # Battese and Coelli (1992) model -----------------------------------------
##D 
##D t_nhn_BC1992 <- sf(formu, data = banks00_07, it = my.it, subset = year > 2000,
##D                    prod = my.prod, model = "BC1992",
##D                    eff.time.invariant = FALSE,
##D                    mean.u.0i.zero = TRUE, 
##D                    ln.var.v.it = ln.var.v.it,
##D                    ln.var.u.0i = ln.var.u.0i, 
##D                    cost.eff.less.one = FALSE)
##D 
##D # normal-truncated normal -------------------------------------------------
##D 
##D # Kumbhakar (1990) model --------------------------------------------------
##D 
##D # truncation point is constant (for all ids) ------------------------------
##D 
##D t_ntn_K1990_0 <- sf(formu, data = banks00_07, it = my.it, subset = year > 2000,
##D                     prod = my.prod,
##D                     eff.time.invariant = FALSE, 
##D                     mean.u.0i.zero = FALSE,
##D                     ln.var.v.it = ln.var.v.it, 
##D                     ln.var.u.0i = ln.var.u.0i,
##D                     cost.eff.less.one = FALSE)
##D 
##D 
##D # truncation point is determined by variables -----------------------------
##D 
##D t_ntn_K1990_1 <- sf(formu, data = banks00_07, it = my.it, subset = year > 2000,
##D                     prod = my.prod,
##D                     eff.time.invariant = FALSE, 
##D                     mean.u.0i.zero = FALSE, 
##D                     mean.u.0i = mean.u.0i_1,
##D                     ln.var.v.it = ln.var.v.it, 
##D                     ln.var.u.0i = ln.var.u.0i,
##D                     cost.eff.less.one = FALSE)
##D 
##D # Efficiencies are tiny, since empirically truncation points are quite big.
##D # Try withouth an intercept in conditional mean f-n
##D 
##D t_ntn_K1990_2 <- sf(formu, data = banks00_07, it = my.it, subset = year > 2000,
##D                     prod = my.prod,
##D                     eff.time.invariant = FALSE, 
##D                     mean.u.0i.zero = FALSE, 
##D                     mean.u.0i = mean.u.0i_2,
##D                     ln.var.v.it = ln.var.v.it, 
##D                     ln.var.u.0i = ln.var.u.0i,
##D                     cost.eff.less.one = FALSE)
##D 
##D # Kumbhakar (1990) modified model -----------------------------------------
##D 
##D t_ntn_K1990modified <- sf(formu, data = banks00_07, it = my.it, subset = year > 2000,
##D                           prod = my.prod, model = "K1990modified",
##D                           eff.time.invariant = FALSE, 
##D                           mean.u.0i.zero = FALSE, 
##D                           mean.u.0i = mean.u.0i_1,
##D                           ln.var.v.it = ln.var.v.it, 
##D                           ln.var.u.0i = ln.var.u.0i,
##D                           cost.eff.less.one = FALSE)
##D 
##D # Battese and Coelli (1992) model -----------------------------------------
##D 
##D 
##D t_ntn_BC1992 <- sf(formu, data = banks00_07, it = my.it, subset = year > 2000,
##D                    prod = my.prod, model = "BC1992",
##D                    eff.time.invariant = FALSE, 
##D                    mean.u.0i.zero = FALSE, 
##D                    mean.u.0i = mean.u.0i_1,
##D                    ln.var.v.it = ln.var.v.it, 
##D                    ln.var.u.0i = ln.var.u.0i,
##D                    cost.eff.less.one = FALSE)
##D 
##D # The next one (without "subset = year > 2000" option) converges OK
##D 
##D t_ntn_BC1992 <- sf(formu, data = banks00_07, it = my.it,
##D                    prod = my.prod, model = "BC1992",
##D                    eff.time.invariant = FALSE, 
##D                    mean.u.0i.zero = FALSE, 
##D                    mean.u.0i = mean.u.0i_1,
##D                    ln.var.v.it = ln.var.v.it, 
##D                    ln.var.u.0i = ln.var.u.0i,
##D                    cost.eff.less.one = FALSE)
##D 
##D 
##D # Panel data examples end -------------------------------------------------
##D 
## End(Not run)




