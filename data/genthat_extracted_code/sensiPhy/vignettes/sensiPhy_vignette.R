## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(eval = F)

## ---- out.width = "700px", echo=FALSE, eval=T----------------------------
knitr::include_graphics("sensiPhy_workflow_functions.png")

## ----echo=TRUE, warning=FALSE, message=FALSE-----------------------------
#  library(sensiPhy)
#  # run analysis:
#  influ <- influ_phylm(log(gestaLen) ~ log(adultMass), phy = alien$phy[[1]],
#                       data = alien$data, track=FALSE)

## ----echo=TRUE, warning=FALSE, message=FALSE, fig.width=7.5, fig.height=6----
#  # To check summary results:
#  summary(influ)
#  
#  # Most influential species
#  influ$influential.species
#  
#  # Visual diagnostics
#  sensi_plot(influ)

## ----echo=TRUE, warning=FALSE, message=FALSE, fig.width=6, fig.height=5.5----
#  # Check most influential species on the original regression plot:
#  sensi_plot(influ, graphs = 2)

## ----echo=TRUE, warning=FALSE, message=FALSE, fig.width=6.5, fig.height=4----
#  # Logtransform data
#  alien.data$logMass <- log(alien.data$adultMass)
#  # Run sensitivity analysis:
#  influ <- influ_physig("logMass", data = alien.data, phy = alien.phy[[1]], track=FALSE)
#  # You can change the method used to estimate signal:
#  influ2 <- influ_physig("logMass", data = alien.data, phy = alien.phy[[1]], method = "lambda", track=FALSE)
#  
#  # To check summary results:
#  summary(influ)
#  # Most influential speciesL
#  influ$influential.species
#  # Visual diagnostics
#  sensi_plot(influ)
#  sensi_plot(influ2)

## ----echo=TRUE, warning=FALSE, message=FALSE, fig.width=4.5, fig.height=4----
#  # You can specify which graph to print:
#  sensi_plot(influ, graphs = 1)
#  sensi_plot(influ2, graphs = 1)

## ----echo=TRUE, warning=FALSE, message=FALSE, fig.width=7.5, fig.height=5.5----
#  # Load data:
#  data("primates")
#  # Model trait evolution accounting for influential species
#  adultMass<-primates$data$adultMass
#  names(adultMass)<-rownames(primates$data)
#  # Model trait evolution accounting for influential species
#  influ_cont<-influ_continuous(data = adultMass,phy = primates$phy[[1]],
#  model = "OU",cutoff = 2,n.cores = 2,track = FALSE)
#  # Print summary statistics for the transitions rates, aic-values and (if applicable)
#  # optimisation parameter
#  summary(influ_cont)
#  # Visual diagnostics
#  sensi_plot(influ_cont)

## ----echo=TRUE, warning=FALSE, message=FALSE, fig.width=7.5, fig.height=5.5----
#  # Load data:
#  data("primates")
#  
#  # Create a binary trait factor
#  adultMass_binary<-ifelse(primates$data$adultMass > 7350, "big", "small")
#  adultMass_binary<-as.factor(as.factor(adultMass_binary))
#  names(adultMass_binary)<-rownames(primates$data)
#  
#  # Model trait evolution accounting for influential species - symmetric model
#  influ_binary <- influ_discrete(data = adultMass_binary, phy = primates$phy[[1]],
#  model = "SYM", transform = "none", cutoff = 2, n.cores = 2, track = FALSE)
#  
#  # Print summary statistics for the transition rates, aic-values and
#  # (if applicable) optimisation parameter
#  summary(influ_binary)
#  
#  # Visual diagnostics - in symmetrical model q12 and q21 are, as expected,
#  # exactly the same
#  sensi_plot(influ_binary)

## ----warning=FALSE, message=FALSE, fig.width=7.5, fig.height=5-----------
#  data(primates)
#  # run analysis:
#  clade <- clade_phylm(log(sexMaturity) ~ log(adultMass), phy = primates$phy[[1]],
#                       data = primates$data, clade.col = "family", track=FALSE)
#  # To check summary results and most influential clades:
#  summary(clade)

## ----echo=TRUE, warning=FALSE, message=FALSE, fig.width=8, fig.height=5.5----
#  # Visual diagnostics for clade removal:
#  sensi_plot(clade, "Cercopithecidae")

## ----echo=TRUE, warning=FALSE, message=FALSE, fig.width=6, fig.height=5----
#  # Logtransform data
#  alien.data$logMass <- log(alien.data$adultMass)
#  # Run sensitivity analysis:
#  clade <- clade_physig(trait.col = "logMass", data = alien.data, n.sim = 100,
#                        phy = alien.phy[[1]], clade.col = "family", method = "K", track=FALSE)
#  summary(clade)
#  sensi_plot(clade, "Bovidae")
#  sensi_plot(clade, "Sciuridae")

## ----echo=TRUE, warning=FALSE, message=FALSE, fig.width=7.5, fig.height=5.5----
#  # Load data:
#  data("primates")
#  # Model trait evolution accounting for influential clades
#  clade_cont <- clade_continuous(data=primates$data, phy = primates$phy[[1]],
#  model="OU", trait.col = "adultMass", clade.col="family", n.sim=30, n.species=10,
#  n.cores = 2, track=TRUE)
#  
#  # Check summary statistics for the transitions rates, aic-values and (if applicable) optimisation parameter
#  summary(clade_cont)
#  # Visual diagnostics
#  sensi_plot(clade_cont,graph="all")
#  # Plot only one clade and one parameter
#  sensi_plot(clade_cont,clade="Cebidae",graph = "optpar")

## ----echo=TRUE, warning=FALSE, message=FALSE, fig.width=7.5, fig.height=5.5----
#  # Load data:
#  data("primates")
#  
#  # Create a binary trait factor
#  primates$data$adultMass_binary<-ifelse(primates$data$adultMass > 7350, "big", "small")
#  # Model trait evolution accounting for influential clades
#  clade_disc <- clade_discrete(data=primates$data,phy = primates$phy[[1]],
#                               model="ARD",transform="kappa",
#                               trait.col = "adultMass_binary", clade.col = "family",
#                               n.sim = 30, n.species=8,n.cores = 2)
#  # Check summary statistics:
#  summary(clade_disc)
#  # Visual diagnostics
#  sensi_plot(clade_disc)

## ----warning=FALSE, message=FALSE, fig.width=7.5, fig.height=6-----------
#  # run analysis:
#  samp <- samp_phylm(log(gestaLen) ~ log(adultMass), phy = alien$phy[[1]],
#                     data = alien$data, n.sim = 50, track=FALSE)
#  
#  # You can change the number of repetitions and break intervals:
#  samp2 <- samp_phylm(log(gestaLen) ~ log(adultMass), phy = alien$phy[[1]],
#                      data = alien$data, n.sim = 100, breaks = c(0.1, 0.2, 0.3, 0.4), track=FALSE)
#  # You can change the phylogenetic model:
#  samp3 <- samp_phylm(log(gestaLen) ~ log(adultMass), phy = alien$phy[[1]],
#                     data = alien$data, model = "kappa", track=FALSE)
#  # Check results:
#  summary(samp)

## ----eval=FALSE----------------------------------------------------------
#  # Visual diagnostics
#  sensi_plot(samp)
#  sensi_plot(samp2)
#  sensi_plot(samp3)
#  
#  # You can specify which graph and parameter ("slope" or "intercept") to print:
#  sensi_plot(samp2, graphs = 1)
#  sensi_plot(samp2, param = "intercept")
#  sensi_plot(samp2, graphs = 2, param = "estimate")
#  sensi_plot(samp)
#  sensi_plot(samp2, graphs = 1)

## ----warning=FALSE, message=FALSE, fig.width=7.5, fig.height=7-----------
#  sensi_plot(samp)

## ----warning=FALSE, message=FALSE, fig.width=7.5, fig.height=7-----------
#  # Logtransform data
#  alien.data$logMass <- log(alien.data$adultMass)
#  
#  # Run sensitivity analysis:
#  samp <- samp_physig(trait.col = "logMass", data = alien.data, n.sim = 30, phy = alien.phy[[1]], track=FALSE)
#  # You can change the method used to estimate signal:
#  samp2 <- samp_physig(trait.col = "logMass", data = alien.data, n.sim = 30,
#                      phy = alien.phy[[1]], method = "lambda", track=FALSE)
#  # Check results:
#  summary(samp)
#  # Visual diagnostics
#  sensi_plot(samp)

## ----eval=FALSE----------------------------------------------------------
#  # More visual diagnostics
#  sensi_plot(samp2)
#  sensi_plot(samp, graphs = 1)

## ----warning=FALSE, message=FALSE, fig.width=7.5, fig.height=4-----------
#  # Load data:
#  data("primates")
#  
#  # Model trait evolution
#  adultMass<-primates$data$adultMass
#  names(adultMass)<-rownames(primates$data)
#  samp_cont<-samp_continuous(data = adultMass,phy = primates$phy[[1]],
#  model = "OU",n.sim=25,breaks=seq(.05,.2,.05),n.cores = 2, track = FALSE)
#  # Print summary statistics for the transitions rates, aic-values and (if applicable)
#  # optimisation parameter
#  summary(samp_cont)
#  # Visual diagnostics
#  sensi_plot(samp_cont)

## ----warning=FALSE, message=FALSE, fig.width=8, fig.height=7-------------
#  # Load data:
#  data("primates")
#  # Create a binary trait factor
#  adultMass_binary<-ifelse(primates$data$adultMass > 7350, "big", "small")
#  adultMass_binary<-as.factor(as.factor(adultMass_binary))
#  names(adultMass_binary)<-rownames(primates$data)
#  # Model trait evolution
#  samp_binary <- samp_discrete(data = adultMass_binary,phy = primates$phy[[1]], n.sim=25,
#      breaks = seq(.1,.3,.1),model = "ARD", transform = "lambda", n.cores = 2,
#      track = TRUE)
#  # Print summary statistics for the transitions rates, aic-values and (if applicable)
#  # optimisation parameter
#  summary(samp_binary)
#  # Visual diagnostics
#  sensi_plot(samp_binary)

## ----warning=FALSE, message=FALSE, fig.width=7.5, fig.height=6-----------
#  # Load data
#  data(alien)
#  # This analysis needs a multiphylo file:
#  class(alien$phy)
#  alien$phy
#  # run PGLS accounting for phylogenetic uncertainty:
#  tree <- tree_phylm(log(gestaLen) ~ log(adultMass), phy = alien$phy,
#                     data = alien$data, n.tree = 30, track=FALSE)
#  # To check summary results:
#  summary(tree)
#  # Visual diagnostics
#  sensi_plot(tree)

## ----warning=FALSE, message=FALSE, fig.width=7.5, fig.height=4-----------
#  # Load data:
#  data(alien)
#  # Logtransform data
#  alien.data$logMass <- log(alien.data$adultMass)
#  # Run sensitivity analysis:
#  tree <- tree_physig(trait.col = "logMass", data = alien.data, phy = alien.phy, track=FALSE)
#  summary(tree)

## ----eval=FALSE----------------------------------------------------------
#  sensi_plot(tree, graphs = 1)
#  sensi_plot(tree, graphs = 2)

## ----warning=FALSE, message=FALSE, fig.width=6, fig.height=4-------------
#  sensi_plot(tree)

## ----warning=FALSE, message=FALSE, fig.width=7.5, fig.height=6-----------
#  # Load data:
#  data("primates")
#  # Model trait evolution accounting for phylogenetic uncertainty
#  adultMass<-primates$data$adultMass
#  names(adultMass)<-rownames(primates$data)
#  tree_cont<-tree_continuous(data = adultMass,phy = primates$phy,
#  model = "OU",n.tree=30,n.cores = 2,track = FALSE)
#  # Print summary statistics for the transitions rates, aic-values and (if applicable)
#  # optimisation parameter
#  summary(tree_cont)

## ----eval=FALSE----------------------------------------------------------
#  # Plot only some parameters
#  sensi_plot(tree_cont,graphs="sigsq")
#  sensi_plot(tree_cont,graphs="optpar")

## ----warning=FALSE, message=FALSE, fig.width=7.5, fig.height=6-----------
#  ## Visual diagnostics
#  sensi_plot(tree_cont)

## ----warning=FALSE, message=FALSE, fig.width=7.5, fig.height=6-----------
#  # Load data:
#  data("primates")
#  # Create a binary trait factor
#  adultMass_binary<-ifelse(primates$data$adultMass > 7350, "big", "small")
#  adultMass_binary<-as.factor(as.factor(adultMass_binary))
#  names(adultMass_binary)<-rownames(primates$data)
#  # Model trait evolution accounting for phylogenetic uncertainty
#  tree_binary<-tree_discrete(data = adultMass_binary,phy = primates$phy,
#  model = "ARD",transform = "none",n.tree = 30,n.cores = 2,track = FALSE)
#  # Print summary statistics for the transitions rates, aic-values and (if applicable)
#  # optimisation parameter
#  summary(tree_binary)

## ----eval=FALSE----------------------------------------------------------
#  ## Visual diagnostics
#  sensi_plot(tree_binary,graphs="q12")
#  sensi_plot(tree_binary,graphs="q21")

## ----warning=FALSE, message=FALSE, fig.width=7.5, fig.height=6-----------
#  sensi_plot(tree_binary)

## ----warning=FALSE, message=FALSE, fig.width=6, fig.height=5-------------
#  # run PGLS accounting for intraspecific variation:
#  intra <- intra_phylm(gestaLen ~ adultMass, phy = alien$phy[[1]],
#                       data = alien$data, Vy = "SD_gesta", Vx = "SD_mass",
#                       n.intra = 100, x.transf = log, y.transf = log, track=FALSE)
#  # To check summary results:
#  summary(intra)
#  # Visual diagnostics
#  sensi_plot(intra)

## ----warning=FALSE, message=FALSE, fig.width=7.5, fig.height=6-----------
#  data(alien)
#  # Run sensitivity analysis:
#  intra <- intra_physig(trait.col = "gestaLen", V = "SD_gesta" , data = alien.data,
#                        phy = alien.phy[[1]], n.intra = 100, track=FALSE)
#  summary(intra)

## ----eval=FALSE----------------------------------------------------------
#  sensi_plot(intra, graphs = 1)
#  sensi_plot(intra, graphs = 2)

## ----warning=FALSE, message=FALSE, fig.width=6, fig.height=4-------------
#  sensi_plot(intra)

## ----warning=FALSE, message=FALSE, fig.width=7.5, fig.height=6-----------
#  data(alien)
#  # run analysis:
#  tree_influ <- tree_influ_phylm(log(gestaLen) ~ log(adultMass), phy = alien$phy,
#                                 data = alien$data, n.tree = 5, track=FALSE)
#  # To check summary results:
#  summary(tree_influ)

## ----eval=FALSE----------------------------------------------------------
#  # Visual diagnostics
#  sensi_plot(tree_influ, graphs = 1)
#  sensi_plot(tree_influ, graphs = 2)

## ----warning=FALSE, message=FALSE, fig.width=7.5, fig.height=6-----------
#  sensi_plot(tree_influ)

## ----warning=FALSE, message=FALSE, fig.width=7, fig.height=4-------------
#  data(primates)
#  # run analysis:
#  clade_tree <- tree_clade_phylm(log(sexMaturity) ~ log(adultMass),
#                                 phy = primates$phy, data = primates$data,
#                                 clade.col = "family",
#                                 n.sim = 50, n.tree = 5, track=F)
#  # To check summary results and most influential clades:
#  summary(clade_tree)

## ----warning=FALSE, message=FALSE, fig.width=7.5, fig.height=5-----------
#  # Visual diagnostics for clade removal:
#  sensi_plot(clade_tree)

## ----eval=FALSE----------------------------------------------------------
#  # Specify which clade removal to plot:
#  sensi_plot(clade_tree, "Cercopithecidae")
#  sensi_plot(clade_tree, clade = "Cebidae")

## ----warning=FALSE, message=FALSE, fig.width=6, fig.height=4-------------
#  # Load data:
#  data(alien)
#  # Run analysis:
#  samp <- tree_samp_phylm(log(gestaLen) ~ log(adultMass), phy = alien$phy,
#                          data = alien$data, n.tree = 5, n.sim=30, track=FALSE)
#  summary(samp)
#  head(samp$sensi.estimates)
#  # Visual diagnostics
#  sensi_plot(samp)

## ----eval=FALSE----------------------------------------------------------
#  sensi_plot(samp, graphs = 1)
#  sensi_plot(samp, graphs = 2)

## ----warning=FALSE, message=FALSE, fig.width=7.5, fig.height=6-----------
#  # Load data:
#  data(alien)
#  # run PGLS accounting for intraspecific and phylogenetic variation:
#  intra.tree <- tree_intra_phylm(gestaLen ~ adultMass, data = alien$data, phy = alien$phy,
#                                 Vy = "SD_gesta", n.intra = 10, n.tree = 30,
#                                 y.transf = log, x.transf = log, track=FALSE)
#  # To check summary results:
#  summary(intra.tree)
#  # Visual diagnostics
#  sensi_plot(intra.tree, uncer.type = "all") #or uncer.type = "tree", uncer.type = "intra"

## ----warning=FALSE, message=FALSE----------------------------------------
#  library(sensiPhy)
#  # Load data:
#  data(alien)
#  # Match data and phy based on model formula:
#  comp.data <- match_dataphy(gestaLen ~ homeRange, data = alien$data, alien$phy[[1]], track=FALSE)
#  # With a `multiphylo` tree:
#  comp.data2 <- match_dataphy(homeRange ~ homeRange, data = alien$data, alien$phy, track=FALSE)
#  # Check combined data:
#  knitr::kable(head(comp.data$data))

## ----warning=FALSE, message=FALSE, fig.width=7.5, fig.height=6-----------
#  # Check phy:
#  plot(comp.data$phy)

## ----warning=FALSE, message=FALSE, fig.width=7.5, fig.height=6-----------
#  # See species dropped from phy or data:
#  comp.data$dropped

## ----warning=FALSE, message=FALSE, fig.width=7.5, fig.height=6-----------
#  library(sensiPhy)
#  # Load caper:
#  library(caper)
#  # Load data
#  data(alien)
#  knitr::kable(head(alien.data))

## ----warning=FALSE, message=FALSE, fig.width=5, fig.height=4-------------
#  data <- alien.data
#  phy = alien.phy[[1]]
#  
#  # Test phylogenetic signal for missing data:
#  homeNAsig <- miss.phylo.d(data, phy, binvar = homeRange)
#  print(homeNAsig)
#  plot(homeNAsig)

## ----warning=FALSE, message=FALSE, fig.width=5, fig.height=4-------------
#  massNAsig <- miss.phylo.d(data, phy, binvar = adultMass)
#  print(massNAsig)
#  plot(massNAsig)

## ----warning=FALSE, message=FALSE, fig.width=8, fig.height=4-------------
#  library(sensiPhy)
#  # Load data:
#  data("primates")
#  # Run analysis
#  fit.ms <- tree_bd(phy = primates.phy, n.tree = 30, method = "ms")
#  # Check results
#  summary(fit.ms)
#  # Plot data
#  sensi_plot(fit.ms)

## ----warning=FALSE, message=FALSE, fig.width=8, fig.height=4-------------
#  # Load data:
#  data("primates")
#  # Run analysis
#  fit.km <- tree_bd(phy = primates.phy, n.tree = 30, method = "km")
#  # Check results
#  summary(fit.km)
#  # Plot data
#  sensi_plot(fit.km)

## ----warning=FALSE, message=FALSE, fig.width=8, fig.height=4-------------
#  ### prepare dataset for caper pgls:
#  library(caper)
#  library(phytools)
#  library(phylolm)
#  library(sensiPhy)
#  # selected variables from dataset:
#  alien.data <- alien.data[c("gestaLen", "adultMass")]
#  
#  # create variable with species names:
#  alien.data$sp <- rownames(alien.data)
#  
#  # caper
#  # prepare comparative dataset:
#  comp.dat <- comparative.data(data = alien.data, phy = alien.phy[[1]],
#                               names.col = "sp")
#  # check comparative dataset:
#  print(comp.dat)
#  
#  ### Run PGLS analysis (full model)
#  # using caper (lambda)
#  fit.caper.lam <- pgls(log(gestaLen)~ log(adultMass), comp.dat, lambda="ML")
#  coef(fit.caper.lam)
#  
#  # using caper (delta)
#  fit.caper.del <- pgls(log(gestaLen)~ log(adultMass), comp.dat, delta="ML")
#  coef(fit.caper.del)
#  
#  # using phylolm (lambda)
#  fit.phylo.lam <- phylolm(log(gestaLen)~ log(adultMass), comp.dat$data, comp.dat$phy,
#                   model = "lambda")
#  coef(fit.phylo.lam)
#  
#  # using phylolm (del)
#  fit.phylo.del <- phylolm(log(gestaLen)~ log(adultMass), comp.dat$data, comp.dat$phy,
#                           model = "delta")
#  coef(fit.phylo.del)
#  
#  ### run sensitivity analysis with sensiPhy (influential species):
#  library(sensiPhy)
#  # run analysis (lambda):
#  lam <- influ_phylm(log(gestaLen) ~ log(adultMass), phy = comp.dat$phy,
#                       data = comp.dat$data, model = "lambda")
#  # check full model estimates and compare to initial estimates:
#  lam$full.model.estimates
#  # test for influential species:
#  summary(lam)
#  
#  # run analysis (delta):
#  del <- influ_phylm(log(gestaLen) ~ log(adultMass), phy = comp.dat$phy,
#                       data = comp.dat$data, model = "delta")
#  # check full model estimates and compare to initial estimates:
#  del$full.model.estimates
#  # test for influential species:
#  summary(del)

## ----warning=FALSE, message=FALSE, fig.width=8, fig.height=4-------------
#  
#  # 2. phylogenetic signal:-------------------------------------------------------
#  library(picante)
#  library(phytools)
#  library(sensiPhy)
#  
#  ### Estimate phylogenetic signal:
#  # using picante (K)
#  phylosignal(log(comp.dat$data$adultMass), comp.dat$phy, reps = 1000)
#  
#  # using phytools (K):
#  phytools::phylosig(x = log(comp.dat$data$adultMass), tree = comp.dat$phy,
#                     nsim = 1000,
#                     method = "K", test = T)
#  
#  # using phytools (lambda):
#  phytools::phylosig(x = log(comp.dat$data$adultMass), tree = comp.dat$phy,
#                     nsim = 1000,
#                     method = "lambda", test = T)
#  
#  ### run sensitivity analysis with sensiPhy (influential species):
#  library(sensiPhy)
#  # Load data:
#  data(alien)
#  # Logtransform data
#  comp.dat$data$logMass <- log(comp.dat$data$adultMass)
#  
#  # Run sensitivity analysis (K):
#  influ.k <- influ_physig("logMass", data = comp.dat$data, phy = comp.dat$phy,
#                        method = "K")
#  # check full model estimates and compare to initial estimates:
#  influ.k$full.data.estimates
#  # check for influential species:
#  summary(influ.k)
#  
#  # Run sensitivity analysis (lambda):
#  influ.lam <- influ_physig("logMass", data = comp.dat$data, phy = comp.dat$phy,
#                        method = "lambda")
#  # check full model estimates and compare to initial estimates:
#  influ.lam$full.data.estimates
#  # check for influential species:
#  summary(influ.lam)

