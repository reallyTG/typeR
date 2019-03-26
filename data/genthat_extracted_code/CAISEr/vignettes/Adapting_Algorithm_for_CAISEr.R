## ------------------------------------------------------------------------
suppressPackageStartupMessages(library(smoof))
suppressPackageStartupMessages(library(MOEADr))

### Build function names (instances: UF1 - UF7, dimensions 10 - 40)
fname   <- paste0("UF_", 1:7)
dims    <- c(10:40)
allfuns <- expand.grid(fname, dims, stringsAsFactors = FALSE)

# Assemble instances list
Instance.list <- vector(nrow(allfuns), mode = "list")
for (i in 1:length(Instance.list)){
  Instance.list[[i]]$FUN <- paste0(allfuns[i,1], "_", allfuns[i,2])
}

### Build the functions listed in Instance.list
# (so that they can be properly used)
for (i in 1:nrow(allfuns)){
  assign(x = Instance.list[[i]]$FUN,
     value = MOEADr::make_vectorized_smoof(prob.name  = "UF",
                    dimensions = allfuns[i, 2],
                    id = as.numeric(strsplit(allfuns[i, 1], "_")[[1]][2])))
}

## ------------------------------------------------------------------------
# Prepare algorithm function to be used in run_experiment():
myalgo <- function(type, instance){
  # Input parameters:
  #     - type (variant to use: "original" or "moead.de")
  #     - instance (instance to be solved, e.g., instance = Instance.list[[i]])
  # All other parameters are set internally

  ## Extract instance information to build the MOEADr problem format
  fdef  <- unlist(strsplit(instance$FUN, split = "_"))
  uffun <- smoof::makeUFFunction(dimensions = as.numeric(fdef[3]),
                                 id         = as.numeric(fdef[2]))
  fattr    <- attr(uffun, "par.set")
  prob.dim <- fattr$pars$x$len
  
  ## Build MOEADr problem list
  problem <- list(name = instance$FUN,
                  xmin = fattr$pars$x$lower,
                  xmax = fattr$pars$x$upper,
                  m    = attr(uffun, "n.objectives"))

  ## Load presets for the algorithm provided in input 'type' and 
  ## modify whatever is needed for this particular experiment
  
  algo.preset <- MOEADr::preset_moead(type)
  algo.preset$decomp$H <- 99 # <-- set population size
  algo.preset$stopcrit[[1]]$name <- "maxeval" # <-- type of stop criterion
  algo.preset$stopcrit[[1]]$maxeval <- 2000 * prob.dim # stop crit.
  poly.ind <- which(sapply(algo.preset$variation,
                           function(x){x$name == "polymut"}))
  algo.preset$variation[[poly.ind]]$pm <- 1 / prob.dim # <--- pm = 1/d
  
  ## Run algorithm on "instance"
  out <- MOEADr::moead(preset = algo.preset, problem = problem,
                       showpars = list(show.iters = "none"))

  ## Read reference data to calculate the IGD
  Yref  <- as.matrix(read.table(paste0("../inst/extdata/pf_data/",
                                       fdef[1], fdef[2], ".dat")))
  IGD = MOEADr::calcIGD(Y = out$Y, Yref = Yref)

  ## Return IGD as field "value" in the output list
  return(list(value = IGD))
}

## ------------------------------------------------------------------------
# Assemble Algorithm.list. Notice that we need to provide an alias for each 
# method, since both algorithms have the same '$FUN' argument.
Algorithm.list <- list(list(FUN   = "myalgo", 
                            alias = "Algorithm 1", 
                            type  = "original"), 
                       list(FUN   = "myalgo", 
                            alias = "Algorithm 2", 
                            type  = "moead.de"))

## ---- eval=FALSE---------------------------------------------------------
#  library(CAISEr)
#  my.results <- run_experiment(Instance.list  = Instance.list,
#                               Algorithm.list = Algorithm.list,
#                               power = 0.8,      # Desired power: 80%
#                               d = 0.5,          # to detect differences greater
#                                                 # than 0.5 standard deviations
#                               sig.level = 0.05, # at a 95% confidence level.
#                               se.max = 0.05,    # Measurement error: 5%
#                               dif = "perc",     # on the paired percent
#                                                 # differences of means,
#                               method = "boot",  # calculated using bootstrap.
#                               nstart = 15,      # Start with 20 runs/algo/inst
#                               nmax   = 200,     # and do no more than 200 runs/inst
#                               seed   = 1234)    # PRNG seed (for reproducibility)

## ---- echo=FALSE---------------------------------------------------------
load("../inst/extdata/vignette_results.RData")

## ---- fig.align="center", fig.width=7, fig.height=5----------------------
# Take a look at the data summary:
# summary(my.results)
# print(my.results)

suppressPackageStartupMessages(library(car))
car::qqPlot(my.results$data.summary$phi.j, 
            pch = 20, las = 1, 
            ylab = "observed results", xlab = "theoretical quantiles")

## ------------------------------------------------------------------------
t.test(my.results$data.summary$phi.j)

## ----fig.width=7,fig.height=7--------------------------------------------
suppressPackageStartupMessages(library(dplyr))
suppressPackageStartupMessages(library(ggplot2))
suppressPackageStartupMessages(library(ggridges))

# Adjust instance names for plotting
mydata <- my.results$data.raw
mydata$Instance <- gsub(pattern = "UF\\_", replacement = "UF", mydata$Instance)
mydata$Instance <- gsub(pattern = "\\_", replacement = " (", mydata$Instance)
mydata$Instance <- sapply(mydata$Instance, FUN = function(x){paste0(x, ")")})

ggplot2::ggplot(mydata, 
                aes(x = Observation, y = Instance, fill = Algorithm)) + 
  ggridges::geom_density_ridges(alpha = 0.7) + 
  ggplot2::ggtitle("Estimated IGD distribution", 
                   subtitle = "for each algorithm on each instance") + 
  ggplot2::theme(legend.position = "bottom")

## ---- fig.width=7--------------------------------------------------------
# Calculate confidence intervals for each instance
algos <- unique(mydata$Algorithm)
ninstances <- length(my.results$instances.sampled)
CIs <- data.frame(instance  = rep(unique(mydata$Instance, times = 2)),
                  algorithm = rep(algos, each = ninstances),
                  x.est     = 0, CI.l = 0, CI.u = 0)

for (i in 1:ninstances){
  tmpdata <- mydata %>% 
    filter(Instance == unique(mydata$Instance)[i])
  myt1 <- t.test(tmpdata$Observation[tmpdata$Algorithm == algos[1]])
  myt2 <- t.test(tmpdata$Observation[tmpdata$Algorithm == algos[2]])
  
  CIs[i,3:5] <- c(myt1$estimate, as.numeric(myt1$conf.int))
  CIs[i + ninstances,3:5] <- c(myt2$estimate, as.numeric(myt2$conf.int))
}

# Plot individual confidence intervals for each instance
myplot <- ggplot2::ggplot(CIs, aes(x = instance, 
                                   y = x.est, ymin = CI.l, ymax = CI.u,
                                   group = algorithm, colour = algorithm,
                                   fill = algorithm))
myplot + 
  ggplot2::geom_pointrange(position = position_dodge(width = 0.5), alpha = 0.7) + 
  ggplot2::xlab("Instance") + ggplot2::ylab("IGD") + 
  ggplot2::ggtitle("Estimated mean IGD", 
                   subtitle = "for each algorithm on each instance") + 
  ggplot2::theme(legend.position = "bottom",
                 axis.text.x = element_text(angle = 55, hjust = 1, size = 6))

