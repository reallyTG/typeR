library(MPTinR)


### Name: fit.mpt
### Title: Function to fit MPT models
### Aliases: fit.mpt
### Keywords: models tree

### ** Examples

# The first example fits the MPT model presented in Riefer and Batchelder (1988, Figure 1)
# to the data presented in Riefer and Batchelder (1988, Table 1)
# Note that Riefer and Batchelder (1988, pp. 328) did some hypotheses tests not replicated here.
# Instead, we use each condition (i.e., row in Table 1) as a different dataset.

# load the data
data(rb.fig1.data, package = "MPTinR")

#get the character string with the position of the model:
model1 <- system.file("extdata", "rb.fig1.model", package = "MPTinR")
model1.eqn <- system.file("extdata", "rb.fig1.model.eqn", package = "MPTinR")

# just fit the first dataset:
fit.mpt(rb.fig1.data[1,], model1, n.optim = 1)
fit.model(rb.fig1.data[1,], model1, n.optim = 1)

#fit all datasets:
fit.mpt(rb.fig1.data, model1, n.optim = 1)
fit.model(rb.fig1.data, model1, n.optim = 1)

#fit all datasets using the .EQN model file:
fit.mpt(rb.fig1.data, model1.eqn, n.optim = 1)

#fit using a textConnection (i.e., you can specify the model in your script/code):
model1.txt <- "p * q * r
p * q * (1-r)
p * (1-q) * r
p * (1-q) * (1-r) + (1-p)"
fit.mpt(rb.fig1.data, textConnection(model1.txt), n.optim = 1)



# The second example fits the MPT model presented in Riefer and Batchelder (1988, Figure 2)
# to the data presented in Riefer and Batchelder (1988, Table 3)
# First, the model without restrictions is fitted: ref.model
# Next, the model with all r set equal is fitted: r.equal
# Then, the model with all c set equal is fitted: c.equal
# Finally, the inferential tests reported by Riefer & Batchelder, (1988, p. 332) are executed.

# get the data
data(rb.fig2.data, package = "MPTinR")

# positions of model and restriction files:
model2 <- system.file("extdata", "rb.fig2.model", package = "MPTinR")
model2r.r.eq <- system.file("extdata", "rb.fig2.r.equal", package = "MPTinR")
model2r.c.eq <- system.file("extdata", "rb.fig2.c.equal", package = "MPTinR")

# The full (i.e., unconstrained) model
(ref.model <- fit.mpt(rb.fig2.data, model2))

# All r equal
(r.equal <- fit.mpt(rb.fig2.data, model2, model2r.r.eq))

# All c equal
(c.equal <- fit.mpt(rb.fig2.data, model2, model2r.c.eq))

# is setting all r equal a good idea?
(g.sq.r.equal <- r.equal[["goodness.of.fit"]][["G.Squared"]] - 
				ref.model[["goodness.of.fit"]][["G.Squared"]])
(df.r.equal <- r.equal[["goodness.of.fit"]][["df"]] - 
				ref.model[["goodness.of.fit"]][["df"]])
(p.value.r.equal <- pchisq(g.sq.r.equal, df.r.equal , lower.tail = FALSE))

# is setting all c equal a good idea?
(g.sq.c.equal <- c.equal[["goodness.of.fit"]][["G.Squared"]] - 
				ref.model[["goodness.of.fit"]][["G.Squared"]])
(df.c.equal <- c.equal[["goodness.of.fit"]][["df"]] - 
				ref.model[["goodness.of.fit"]][["df"]])
(p.value.c.equal <- pchisq(g.sq.c.equal, df.c.equal , lower.tail = FALSE))

# You can specify restrictions also via a list instead of an external file:
# All r equal
r.equal.2 <- fit.mpt(rb.fig2.data, model2, list("r0 = r1 = r2= r3 = r4"), n.optim = 5)
all.equal(r.equal, r.equal.2)

# All c equal
c.equal.2 <- fit.mpt(rb.fig2.data, model2, list("c0 = c1 = c2 = c3= c4"))
all.equal(c.equal, c.equal.2)


## Not run: 
##D 
##D # Example from Broder & Schutz (2009)
##D # We fit the data from the 40 individuals from their Experiment 3
##D # We fit three different models:
##D # 1. Their 2HTM model: br.2htm
##D # 2. A restricted 2HTM model with Dn = Do: br.2htm.res
##D # 3. A 1HTM model (i.e., Dn = 0): br.1htm
##D # We fit the models with, as well as without, applied inequality restrictions (see Details)
##D # that is, for some models (.ineq) we impose: G1 < G2 < G3 < G4 < G5 
##D # As will be apparent, the inequality restrictions do not hold for all individuals.
##D # Finally, we compute the FIA for all models, taking inequalities into account.
##D 
##D data(d.broeder, package = "MPTinR")
##D m.2htm <- system.file("extdata", "5points.2htm.model", package = "MPTinR")
##D r.2htm <- system.file("extdata", "broeder.2htm.restr", package = "MPTinR")
##D r.1htm <- system.file("extdata", "broeder.1htm.restr", package = "MPTinR")
##D i.2htm <- system.file("extdata", "broeder.2htm.ineq", package = "MPTinR")
##D ir.2htm <- system.file("extdata", "broeder.2htm.restr.ineq", package = "MPTinR")
##D ir.1htm <- system.file("extdata", "broeder.1htm.restr.ineq", package = "MPTinR")
##D 
##D # fit the original 2HTM
##D br.2htm <- fit.mpt(d.broeder, m.2htm)
##D br.2htm.ineq <- fit.mpt(d.broeder, m.2htm, i.2htm)
##D 
##D # do the inequalities hold for all participants?
##D br.2htm.ineq[["parameters"]][["individual"]][,"estimates",]
##D br.2htm[["parameters"]][["individual"]][,"estimates",]
##D # See the difference between forced and non-forced inequality restrictions:
##D round(br.2htm[["parameters"]][["individual"]][,"estimates",] -
##D 		br.2htm.ineq[["parameters"]][["individual"]][,"estimates",],2)
##D 
##D # The same for the other two models
##D # The restricted 2HTM
##D br.2htm.res <- fit.mpt(d.broeder, m.2htm, r.2htm)
##D br.2htm.res.ineq <- fit.mpt(d.broeder, m.2htm, ir.2htm)
##D round(br.2htm.res[["parameters"]][["individual"]][,"estimates",] - 
##D 		br.2htm.res.ineq[["parameters"]][["individual"]][,"estimates",],2)
##D # The 1HTM
##D br.1htm <- fit.mpt(d.broeder, m.2htm, r.1htm)
##D br.1htm.ineq <- fit.mpt(d.broeder, m.2htm, ir.1htm)
##D round(br.2htm.res[["parameters"]][["individual"]][,"estimates",] - 
##D 		br.2htm.res.ineq[["parameters"]][["individual"]][,"estimates",],2)
##D 
##D # identical to the last fit of the 1HTM (using a list as restriction):
##D br.1htm.ineq.list <- fit.mpt(d.broeder, m.2htm, list("G1 < G2 < G3 < G4 < G5", "Dn = 0"))
##D all.equal(br.1htm.ineq, br.1htm.ineq.list)  # TRUE
##D 
##D # These results show that inequality restrictions do not hold for all datasets.
##D # (It would look differently if we excluded critical cases, 
##D # i.e., 2, 6, 7, 10, 18, 21, 25, 29, 32, 34, 35, 37, 38)
##D # Therefore, we get the FIA for the models as computed above 
##D 
##D br.2htm.fia <- fit.mpt(d.broeder, m.2htm, fia = 200000)
##D br.2htm.ineq.fia <- fit.mpt(d.broeder, m.2htm, i.2htm, fia = 200000)
##D br.2htm.res.fia <- fit.mpt(d.broeder, m.2htm, r.2htm, fia = 200000 )
##D br.2htm.res.ineq.fia <- fit.mpt(d.broeder, m.2htm, ir.2htm, fia = 200000)
##D br.1htm.fia <- fit.mpt(d.broeder, m.2htm, r.1htm, fia = 200000)
##D br.1htm.ineq.fia <- fit.mpt(d.broeder, m.2htm, ir.1htm, fia = 200000)
##D 
##D # Model selection using the FIA
##D (br.select <- select.mpt(list(br.2htm.fia, br.2htm.ineq.fia, br.2htm.res.fia, 
##D                               br.2htm.res.ineq.fia, br.1htm.fia, br.1htm.ineq.fia)))
##D                               
##D # The same results, ordered by FIA
##D br.select[order(br.select[,"delta.FIA.sum"]),]
##D 
##D # Note that FIA for individual data (.sum) is not consistent (i.e., the penalty
##D # for the nested model br.1htm.ineq.fia is not really smaller than the penalty
##D # for the superordinate model br.2htm.ineq.fia).
##D # Hence, one should use the aggregated data for this analysis (not shown here)! 
##D 
##D # Compare this with the model selection not using FIA:
##D select.mpt(list(br.2htm, br.2htm.ineq, br.2htm.res, br.2htm.res.ineq, br.1htm, br.1htm.ineq))
##D 
##D # Only use the aggregated data:
##D d.broeder.agg <- colSums(d.broeder)
##D br.2htm.agg <- fit.mpt(d.broeder.agg, m.2htm)
##D br.2htm.res.agg <- fit.mpt(d.broeder.agg, m.2htm, r.2htm)
##D br.1htm.agg <- fit.mpt(d.broeder.agg, m.2htm, r.1htm)
##D 
##D select.mpt(list(br.2htm.agg, br.2htm.res.agg, br.1htm.agg), output = "full")
##D 
##D 
##D # compare speed of no multicore versus multicore for multiple datasets:
##D 
##D require(snowfall)
##D # change number of CPUs if more are available
##D nCPU = 2
##D sfInit( parallel=TRUE, cpus=nCPU, type = "SOCK" )
##D 
##D # NO multicore
##D system.time(fit.mpt(d.broeder, m.2htm))
##D 
##D # multicore:
##D system.time(fit.mpt(d.broeder, m.2htm, multicore = "individual"))
##D 
##D sfStop()
## End(Not run)

  


