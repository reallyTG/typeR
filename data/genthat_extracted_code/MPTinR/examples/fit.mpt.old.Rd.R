library(MPTinR)


### Name: fit.mpt.old
### Title: Function to fit MPT models (old)
### Aliases: fit.mpt.old
### Keywords: models tree

### ** Examples


## Not run: 
##D 
##D # The first example fits the MPT model presented in Riefer and Batchelder (1988, Figure 1)
##D # to the data presented in Riefer and Batchelder (1988, Table 1)
##D # Note that Riefer and Batchelder (1988, pp. 328) did some hypotheses tests, that are not done here.
##D # Rather, we use each condition (i.e., row in Table 1) as a different individual.
##D # We try to use n.optim = 1 here, but this can lead to local minima
##D # In general we recommend to set n.optim >= 5
##D 
##D # load the data
##D data(rb.fig1.data)
##D 
##D #get the character string with the position of the model:
##D model1 <- system.file("extdata", "rb.fig1.model", package = "MPTinR")
##D model1.eqn <- system.file("extdata", "rb.fig1.model.eqn", package = "MPTinR")
##D 
##D # just fit the first "individual":
##D fit.mpt.old(rb.fig1.data[1,], model1, n.optim = 1)
##D 
##D #fit all "individuals":
##D fit.mpt.old(rb.fig1.data, model1, n.optim = 1)
##D 
##D #fit all "individuals" using the .EQN model file:
##D fit.mpt.old(rb.fig1.data, model1.eqn, n.optim = 1)
##D 
##D 
##D 
##D # The second example fits the MPT model presented in Riefer and Batchelder (1988, Figure 2)
##D # to the data presented in Riefer and Batchelder (1988, Table 3)
##D # First, the model without restrictions is fitted: ref.model
##D # Next, the model with all r set equal is fitted: r.equal
##D # Then, the model with all c set equal is fitted: c.equal
##D # Finally, the inferential tests reported by Riefer & Batchelder, (1988, p. 332) are executed.
##D # Note, that n.optim = 10, because of frequent local minima.
##D 
##D # get the data
##D data(rb.fig2.data)
##D 
##D # positions of model and restriction files:
##D model2 <- system.file("extdata", "rb.fig2.model", package = "MPTinR")
##D model2r.r.eq <- system.file("extdata", "rb.fig2.r.equal", package = "MPTinR")
##D model2r.c.eq <- system.file("extdata", "rb.fig2.c.equal", package = "MPTinR")
##D 
##D # The full (i.e., unconstrained) model
##D (ref.model <- fit.mpt.old(rb.fig2.data, model2, n.optim = 10))
##D 
##D # All r equal
##D (r.equal <- fit.mpt.old(rb.fig2.data, model2, model2r.r.eq, n.optim = 10))
##D 
##D # All c equal
##D (c.equal <- fit.mpt.old(rb.fig2.data, model2, model2r.c.eq, n.optim = 10))
##D 
##D # is setting all r equal a good idea?
##D (g.sq.r.equal <- r.equal[["goodness.of.fit"]][["G.Squared"]] - 
##D 			ref.model[["goodness.of.fit"]][["G.Squared"]])
##D (df.r.equal <- r.equal[["goodness.of.fit"]][["df"]] - 
##D 			ref.model[["goodness.of.fit"]][["df"]])
##D (p.value.r.equal <- pchisq(g.sq.r.equal, df.r.equal , lower.tail = FALSE))
##D 
##D # is setting all c equal a good idea?
##D (g.sq.c.equal <- c.equal[["goodness.of.fit"]][["G.Squared"]] - 
##D 		ref.model[["goodness.of.fit"]][["G.Squared"]])
##D (df.c.equal <- c.equal[["goodness.of.fit"]][["df"]] - 
##D 		ref.model[["goodness.of.fit"]][["df"]])
##D (p.value.c.equal <- pchisq(g.sq.c.equal, df.c.equal , lower.tail = FALSE))
##D 
##D 
##D # Example from Broeder & Schuetz (2009)
##D # We fit the data from the 40 individuals from their Experiment 3
##D # We fit three different models:
##D # 1. Their 2HTM model: br.2htm
##D # 2. A restricted 2HTM model with Dn = Do: br.2htm.res
##D # 3. A 1HTM model (i.e., Dn = 0): br.1htm
##D # We fit the models with, as well as without, applied inequality restrictions (see Details)
##D # that is, for some models (.ineq) we impose: G1 < G2 < G3 < G4 < G5 
##D # As will be apparent, the inequality restrictions do not hold for all individuals.
##D # Finally, we compute the FIA for all models, taking inequalities into account.
##D # Note: The following examples will take some time (> 1 hour).
##D 
##D data(d.broeder)
##D m.2htm <- system.file("extdata", "5points.2htm.model", package = "MPTinR")
##D r.2htm <- system.file("extdata", "broeder.2htm.restr", package = "MPTinR")
##D r.1htm <- system.file("extdata", "broeder.1htm.restr", package = "MPTinR")
##D i.2htm <- system.file("extdata", "broeder.2htm.ineq", package = "MPTinR")
##D ir.2htm <- system.file("extdata", "broeder.2htm.restr.ineq", package = "MPTinR")
##D ir.1htm <- system.file("extdata", "broeder.1htm.restr.ineq", package = "MPTinR")
##D 
##D # fit the original 2HTM
##D br.2htm <- fit.mpt.old(d.broeder, m.2htm)
##D br.2htm.ineq <- fit.mpt.old(d.broeder, m.2htm, i.2htm)
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
##D # These results show that we cannot compute inequality constraints for the non inequality
##D #  imposed models (It would look differently if we excluded critical cases, 
##D # i.e., 2, 6, 7, 10, 18, 21, 25, 29, 32, 34, 35, 37, 38)
##D # Therefore, we get the FIA for the models as computed above 
##D # WARNING: The following part will take a long time!
##D 
##D br.2htm.fia <- fit.mpt.old(d.broeder, m.2htm, fia = 200000)
##D br.2htm.ineq.fia <- fit.mpt.old(d.broeder, m.2htm, i.2htm, fia = 200000)
##D br.2htm.res.fia <- fit.mpt.old(d.broeder, m.2htm, r.2htm, fia = 200000 )
##D br.2htm.res.ineq.fia <- fit.mpt.old(d.broeder, m.2htm, ir.2htm, fia = 200000)
##D br.1htm.fia <- fit.mpt.old(d.broeder, m.2htm, r.1htm, fia = 200000)
##D br.1htm.ineq.fia <- fit.mpt.old(d.broeder, m.2htm, ir.1htm, fia = 200000)
##D 
##D # Model selection using the FIA
##D (br.select <- select.mpt(list(orig.2htm = br.2htm.fia, orig.2htm.ineq = br.2htm.ineq.fia,
##D 		res.2htm = br.2htm.res.fia, res.2htm.ineq = br.2htm.res.ineq.fia, 
##D 		orig.1htm = br.1htm.fia, orig.1htm.ineq = br.1htm.ineq.fia)))
##D # The same results, ordered by FIA
##D br.select[order(br.select[,"delta.FIA.sum"]),]
##D 
##D # Compare this with the model selection not using FIA:
##D select.mpt(list(orig.2htm = br.2htm, orig.2htm.ineq = br.2htm.ineq, 
##D 		res.2htm = br.2htm.res, res.2htm.ineq = br.2htm.res.ineq, 
##D 		orig.1htm = br.1htm, orig.1htm.ineq = br.1htm.ineq))
##D 
##D 
##D 
##D 
##D # compare speed of no multicore versus multicore for multiple optimization runs:
##D 
##D require(snowfall)
##D # change number of CPUs if more are available
##D nCPU = 2
##D sfInit( parallel=TRUE, cpus=nCPU, type = "SOCK" )
##D 
##D # NO multicore
##D system.time(fit.mpt.old(d.broeder, m.2htm))
##D 
##D # multicore:
##D system.time(fit.mpt.old(d.broeder, m.2htm, multicore = "n.optim"))
##D 
##D sfStop()
## End(Not run)

  


