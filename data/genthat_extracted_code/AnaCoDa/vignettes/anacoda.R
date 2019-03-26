## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- echo = TRUE, eval = FALSE------------------------------------------
#  genome <- initializeGenomeObject(file = "genome.fasta")
#  parameter <- initializeParameterObject(genome = genome, sphi = 1, num.mixtures = 1, geneAssignment = rep(1, length(genome)))
#  model <- initializeModelObject(parameter = parameter, model = "ROC")
#  mcmc <- initializeMCMCObject(samples = 5000, thinning = 10, adaptive.width=50)
#  runMCMC(mcmc = mcmc, genome = genome, model = model)

## ---- echo = TRUE, eval = FALSE------------------------------------------
#  parameter <- initializeParameterObject(genome = genome, sphi = c(0.5, 2), num.mixtures = 2, geneAssignment = sample.int(2, length(genome), replace = T))

## ---- echo = TRUE, eval = FALSE------------------------------------------
#  genome <- initializeGenomeObject(file = "genome.fasta", observed.expression.file = "synthesis_values.csv")

## ---- echo = TRUE, eval = FALSE------------------------------------------
#  # One case of observed data
#  sepsilon <- 0.1
#  # Two cases of observed data
#  sepsilon <- c(0.1, 0.5)
#  # ...
#  # Five cases of observed data
#  sepsilon <- c(0.1, 0.5, 1, 0.8, 3)
#  
#  parameter <- initializeParameterObject(genome = genome, sphi = 1, num.mixtures = 1, geneAssignment = rep(1, length(genome)), init.sepsilon = sepsilon)

## ---- echo = TRUE, eval = FALSE------------------------------------------
#  model <- initializeModelObject(parameter = parameter, model = "ROC",  fix.observation.noise = TRUE)

## ---- echo = TRUE, eval = FALSE------------------------------------------
#  genome <- initializeGenomeObject(file = "genome.fasta")
#  parameter <- initializeParameterObject(genome = genome, sphi = 1, num.mixtures = 1, geneAssignment = rep(1, length(genome)))
#  model <- initializeModelObject(parameter = parameter, model = "ROC")

## ---- echo = TRUE, eval = FALSE------------------------------------------
#  mcmc <- initializeMCMCObject(samples, thinning=1, adaptive.width=100, est.expression=FALSE, est.csp=TRUE, est.hyper=TRUE, est.mix=TRUE)

## ---- echo = TRUE, eval = FALSE------------------------------------------
#  mcmc <- initializeMCMCObject(samples, thinning=1, adaptive.width=100, est.expression=TRUE, est.csp=FALSE, est.hyper=TRUE, est.mix=TRUE)

## ---- echo = TRUE, eval = FALSE------------------------------------------
#  mcmc <- initializeMCMCObject(samples, thinning=1, adaptive.width=100, est.expression=TRUE, est.csp=TRUE, est.hyper=FALSE, est.mix=TRUE)

## ---- echo = TRUE, eval = FALSE------------------------------------------
#  mcmc <- initializeMCMCObject(samples, thinning=1, adaptive.width=100, est.expression=TRUE, est.csp=TRUE, est.hyper=TRUE, est.mix=FALSE)

## ---- echo = TRUE, eval = FALSE------------------------------------------
#  parameter <- initializeParameterObject(genome = genome, sphi = c(0.5, 2), num.mixtures = 2
#                                         , geneAssignment = sample.int(2, length(genome), replace = T),
#                                         mixture.definition = "allUnique")

## ---- echo = TRUE, eval = FALSE------------------------------------------
#  parameter <- initializeParameterObject(genome = genome, sphi = c(0.5, 2), num.mixtures = 2
#                                         , geneAssignment = sample.int(2, length(genome), replace = T),
#                                         mixture.definition = "mutationShared")

## ---- echo = TRUE, eval = FALSE------------------------------------------
#  parameter <- initializeParameterObject(genome = genome, sphi = c(0.5, 2), num.mixtures = 2
#                                         , geneAssignment = sample.int(2, length(genome), replace = T),
#                                         mixture.definition = "selectionShared")

## ---- echo = TRUE, eval = FALSE------------------------------------------
#  #     [,1] [,2]
#  #[1,]    1    1
#  #[2,]    1    2
#  #[3,]    1    3
#  def.matrix <- matrix(c(1,1,1,1,2,3), ncol=2)
#  parameter <- initializeParameterObject(genome = genome, sphi = c(0.5, 2, 1), num.mixtures = 3,
#                                         geneAssignment = sample.int(3, length(genome), replace = T),
#                                         mixture.definition.matrix = def.matrix)

## ---- echo = TRUE, eval = FALSE------------------------------------------
#  #     [,1] [,2]
#  #[1,]    1    1
#  #[2,]    2    2
#  #[3,]    3    3
#  def.matrix <- matrix(c(1,2,3,1,2,3), ncol=2)

## ---- echo = TRUE, eval = FALSE------------------------------------------
#  #     [,1] [,2]
#  #[1,]    1    1
#  #[2,]    2    1
#  #[3,]    1    2
#  def.matrix <- matrix(c(1,2,1,1,1,2), ncol=2)

## ---- echo = TRUE, eval = FALSE------------------------------------------
#  # writing a restart file every 1000 samples
#  setRestartSettings(mcmc, "restart_file", 1000, write.multiple=TRUE)
#  # writing a restart file every 1000 samples but overwriting it every time
#  setRestartSettings(mcmc, "restart_file", 1000, write.multiple=FALSE)

## ---- echo = TRUE, eval = FALSE------------------------------------------
#  initializeParameterObject(init.with.restart.file = "restart_file.rst")

## ---- echo = TRUE, eval = FALSE------------------------------------------
#  #save objects after a run
#  runMCMC(mcmc = mcmc, genome = genome, model = model)
#  writeParameterObject(parameter = parameter, file = "parameter_out.Rda")
#  writeMCMCObject(mcmc = mcmc, file = "mcmc_out.Rda")

## ---- echo = TRUE, eval = FALSE------------------------------------------
#  #save objects after a run
#  parameter <- loadParameterObject(file = "parameter_out.Rda")
#  mcmc <- loadMCMCObject(file = "mcmc_out.Rda")

## ---- echo = TRUE, eval = FALSE------------------------------------------
#  csp_mat <- getCSPEstimates(parameter = parameter, CSP="Mutation", mixture = 1, samples = 1000)
#  head(csp_mat)
#  #  AA Codon  Posterior     0.025%     0.975%
#  #1  A   GCA -0.2435340 -0.2720696 -0.2165220
#  #2  A   GCC  0.4235546  0.4049132  0.4420680
#  #3  A   GCG  0.7004484  0.6648690  0.7351707
#  #4  C   TGC  0.2016298  0.1679025  0.2387024
#  #5  D   GAC  0.5775052  0.5618199  0.5936979
#  #6  E   GAA -0.4524295 -0.4688044 -0.4356677
#  
#  getCSPEstimates(parameter = parameter, filename = "mutation.csv", CSP="Mutation", mixture = 1, samples = 1000)

## ---- echo = TRUE, eval = FALSE------------------------------------------
#  phi_mat <- getExpressionEstimates(parameter = parameter,
#                                    gene.index = 1:length(genome),
#                                    samples = 1000)
#  head(phi_mat)
#  #           PHI  log10.PHI    Std.Error log10.Std.Error      0.025     0.975 log10.0.025 log10.0.975
#  #[1,] 0.2729446 -0.6188447 0.0001261525    2.362358e-04 0.07331819 0.5455295 -1.13478830 -0.26319141
#  #[2,] 1.4221716  0.1498953 0.0001669425    5.194123e-05 1.09593642 1.7562065  0.03978491  0.24457557
#  #[3,] 0.7459888 -0.1512764 0.0002313539    1.529267e-04 0.31559618 1.2198282 -0.50086958  0.08629407
#  #[4,] 0.6573082 -0.2030291 0.0001935466    1.400333e-04 0.31591233 1.0699855 -0.50043989  0.02937787
#  #[5,] 1.6316901  0.2098120 0.0001846631    4.986347e-05 1.28410352 2.0035207  0.10860000  0.30179215
#  #[6,] 0.6179711 -0.2286806 0.0001744928    1.374863e-04 0.28478950 0.9683327 -0.54550116 -0.01397541

## ---- echo = TRUE, eval = FALSE------------------------------------------
#  # sampling 100 genes at random
#  phi_mat <- getExpressionEstimates(parameter = parameter,
#                                    gene.index = sample(1:length(genome), 100),
#                                    samples = 1000)

## ---- echo = TRUE, eval = FALSE------------------------------------------
#  selection.coefficients <- getSelectionCoefficients(genome = genome,
#                                                     parameter = parameter,
#                                                     samples = 1000)
#  head(selection.coefficients)
#  #                    GCA          GCC        GCG GCT        TGC TGT GAC         GAT ...
#  #SAKL0A00132g -0.1630284 -0.008695144 -0.2097771   0 -0.1014373   0   0 -0.05092397 ...
#  #SAKL0A00154g -0.8494558 -0.045305847 -1.0930388   0 -0.5285367   0   0 -0.26533820 ...
#  #SAKL0A00176g -0.4455753 -0.023764823 -0.5733448   0 -0.2772397   0   0 -0.13918105 ...
#  #SAKL0A00198g -0.3926068 -0.020939740 -0.5051875   0 -0.2442824   0   0 -0.12263567 ...
#  #SAKL0A00220g -0.9746002 -0.051980440 -1.2540685   0 -0.6064022   0   0 -0.30442861 ...
#  #SAKL0A00242g -0.3691110 -0.019686586 -0.4749542   0 -0.2296631   0   0 -0.11529644 ...

## ---- echo = TRUE, eval = FALSE------------------------------------------
#  cai.weights <- getCAIweights(referenceGenome = genome)
#  head(cai.weights)
#  #      GCA       GCC       GCG       GCT       TGC       TGT
#  #0.7251276 0.6282192 0.2497737 1.0000000 0.6222628 1.0000000
#  
#  nc.per.aa <- getNcAA(genome = genome)
#  head(nc.per.aa)
#  #                    A        C        D        E        F        G ...
#  #SAKL0A00132g 3.611111 1.000000 2.200000 2.142857 1.792453 4.109589 ...
#  #SAKL0A00154g 1.843866 2.500000 2.035782 1.942505 1.986595 2.752660 ...
#  #SAKL0A00176g 5.142857       NA 1.857143 1.652174 1.551724 3.122449 ...
#  #SAKL0A00198g 3.800000       NA 1.924779 1.913043 2.129032 4.136364 ...
#  #SAKL0A00220g 3.198529 1.666667 1.741573 1.756757 2.000000 1.371638 ...
#  #SAKL0A00242g 4.500000       NA 2.095890 2.000000 1.408163 3.734043 ...
#  

## ---- echo = TRUE, eval = FALSE------------------------------------------
#  selection.coefficients <- getSelectionCoefficients(genome = genome,
#                                                     parameter = parameter,
#                                                     samples = 1000)
#  s <- exp(selection.coefficients)
#  cai.weights <- getCAIweights(referenceGenome = ref.genome)
#  
#  codon.names <- colnames(s)
#  h <- hist(s[, 1], plot = F)
#  plot(NULL, NULL, axes = F, xlim = c(0,1), ylim = range(c(0,h$counts)),
#       xlab = "s", ylab = "Frequency", main = codon.names[1], cex.lab = 1.2)
#  lines(x = h$breaks, y = c(0,h$counts), type = "S", lwd=2)
#  abline(v = cai.weights[1], lwd=2, lty=2)
#  axis(1, lwd = 3, cex.axis = 1.2)
#  axis(2, lwd = 3, cex.axis = 1.2)

## ---- echo = TRUE, eval = FALSE------------------------------------------
#  trace <- getTrace(parameter)
#  plot(x = trace, what = "Mutation", mixture = 1)

## ---- echo = TRUE, eval = FALSE------------------------------------------
#  trace <- parameter$getTraceObject()
#  plot(x = trace, what = "Expression", mixture = 1, geneIndex = 669)

## ---- echo = TRUE, eval = FALSE------------------------------------------
#  plot(mcmc, what = "LogPosterior", zoom.window = c(9000, 10000))

## ---- echo = TRUE, eval = FALSE------------------------------------------
#  # use the last 500 samples from mixture 1 for posterior estimate.
#  plot(x = model, genome = genome, samples = 500, mixture = 1)

## ---- echo = TRUE, eval = FALSE------------------------------------------
#  plot(parameter, what = "Selection", samples = 500)

