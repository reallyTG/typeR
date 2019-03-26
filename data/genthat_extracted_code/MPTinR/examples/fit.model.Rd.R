library(MPTinR)


### Name: fit.model
### Title: Fit cognitive models for categorical data using model files
### Aliases: fit.model
### Keywords: models tree

### ** Examples


## Not run: 
##D 
##D #####################################
##D ## Fit response-bias or payoff ROC ##
##D #####################################
##D   
##D # Example from Broder & Schutz (2009)
##D # We fit the data from the 40 individuals from their Experiment 3
##D # We fit three different models:
##D # 1. Their SDT Model: br.sdt
##D # 2. Their 2HTM model: br.2htm
##D # 3. A restricted 2HTM model with Dn = Do: br.2htm.res
##D # 4. A 1HTM model (i.e., Dn = 0): br.1htm
##D 
##D data(d.broeder, package = "MPTinR")
##D m.2htm <- system.file("extdata", "5points.2htm.model", package = "MPTinR")
##D 
##D 
##D # We specify the SDT model in the code using a textConnection.
##D # However, textConnection is only called in the function call on the string.
##D 
##D m.sdt <- "
##D 1-pnorm((cr1-mu)/ss)
##D pnorm((cr1-mu)/ss)
##D 
##D 1-pnorm(cr1)
##D pnorm(cr1)
##D 
##D 1-pnorm((cr2-mu)/ss)
##D pnorm((cr2-mu)/ss)
##D 
##D 1-pnorm(cr2)
##D pnorm(cr2)
##D 
##D 1-pnorm((cr3-mu)/ss)
##D pnorm((cr3-mu)/ss)
##D 
##D 1-pnorm(cr3)
##D pnorm(cr3)
##D 
##D 1-pnorm((cr4-mu)/ss)
##D pnorm((cr4-mu)/ss)
##D 
##D 1-pnorm(cr4)
##D pnorm(cr4)
##D 
##D 1-pnorm((cr5-mu)/ss)
##D pnorm((cr5-mu)/ss)
##D 
##D 1-pnorm(cr5)
##D pnorm(cr5)
##D "
##D 
##D # How does the model look like?
##D check.mpt(textConnection(m.sdt))
##D 
##D # fit the SDT (unequal variance version)
##D br.uvsdt <- fit.model(d.broeder, textConnection(m.sdt), 
##D   		lower.bound = c(rep(-Inf, 5), 0, 1), upper.bound = Inf)
##D 
##D # Is there any effect of studying the items?
##D br.uvsdt.2 <- fit.model(d.broeder, textConnection(m.sdt), 
##D 			restrictions.filename = list("mu = 0", "ss = 1"), 
##D 			lower.bound = -Inf, upper.bound = Inf)
##D 
##D (diff.g2 <- br.uvsdt.2[["goodness.of.fit"]][["sum"]][["G.Squared"]] -
##D 			br.uvsdt[["goodness.of.fit"]][["sum"]][["G.Squared"]])
##D (diff.df <- br.uvsdt.2[["goodness.of.fit"]][["sum"]][["df"]] - 
##D 			br.uvsdt[["goodness.of.fit"]][["sum"]][["df"]])
##D 1 - pchisq(diff.g2, diff.df)
##D 
##D # fit the equal variance SDT model:
##D br.evsdt <- fit.model(d.broeder, textConnection(m.sdt), 
##D 			lower.bound = c(rep(-Inf, 5), 0), upper.bound = Inf, 
##D 			restrictions.filename = list("ss = 1"))
##D 
##D # fit the MPTs (see also ?fit.mpt).
##D # In contrast to ?fit.mpt we specify the restrictions using a textConnection or a list!
##D br.2htm <- fit.mpt(d.broeder, m.2htm)
##D br.2htm.res <- fit.mpt(d.broeder, m.2htm, textConnection("Do = Dn"))
##D br.1htm <- fit.mpt(d.broeder, m.2htm, list("Dn = 0"))
##D 
##D select.mpt(list(uvsdt = br.uvsdt, evsdt = br.evsdt, two.htm = br.2htm, 
##D 			two.htm.res = br.2htm.res, one.htm = br.1htm), output = "full")
##D 
##D # the restricted 2HTM "wins" for individual data (although evsdt does not perform too bad),
##D # but the 2htm and restricted 2htm restricted "win" for aggregated data.
##D 
##D 
##D ###################################
##D ## Fit confidence rating ROC SDT ##
##D ###################################
##D #(see ?roc6 for more examples)
##D 
##D # We fit example data from Wickens (2002, Chapter 5)
##D # The example data is from Table 5.1, p. 84
##D # (data is entered in somewhat different order).
##D 
##D # Note that criteria are defined as increments to 
##D # the first (i.e., leftmost) criterion!
##D # This is the only way to do it in MPTinR.
##D 
##D # Data
##D dat <- c(47, 65, 66, 92, 136, 294, 166, 161, 138, 128, 63, 43)
##D 
##D # UVSDT
##D m.uvsdt <- "
##D pnorm(cr1, mu, sigma)
##D pnorm(cr1+cr2, mu, sigma) - pnorm(cr1, mu, sigma)
##D pnorm(cr3+cr2+cr1, mu, sigma) - pnorm(cr2+cr1, mu, sigma)
##D pnorm(cr4+cr3+cr2+cr1, mu, sigma) - pnorm(cr3+cr2+cr1, mu, sigma)
##D pnorm(cr5+cr4+cr3+cr2+cr1, mu, sigma) - pnorm(cr4+cr3+cr2+cr1, mu, sigma)
##D 1 - pnorm(cr5+cr4+cr3+cr2+cr1, mu, sigma)
##D   
##D pnorm(cr1)
##D pnorm(cr2+cr1) - pnorm(cr1)
##D pnorm(cr3+cr2+cr1) - pnorm(cr2+cr1)
##D pnorm(cr4+cr3+cr2+cr1) - pnorm(cr3+cr2+cr1)
##D pnorm(cr5+cr4+cr3+cr2+cr1) - pnorm(cr4+cr3+cr2+cr1)
##D 1 - pnorm(cr5+cr4+cr3+cr2+cr1)
##D "
##D check.mpt(textConnection(m.uvsdt))
##D 
##D # Model fitting
##D (cr_sdt <- fit.model(dat, textConnection(m.uvsdt),
##D             lower.bound=c(-Inf, rep(0, 5), 0.1), upper.bound=Inf))
##D 
##D # To obtain the criteria (which match those in Wickens (2002, p. 90)
##D # obtain the cumulative sum:
##D 
##D cumsum(cr_sdt$parameters[paste0("cr",1:5), 1, drop = FALSE])
##D 
## End(Not run)




