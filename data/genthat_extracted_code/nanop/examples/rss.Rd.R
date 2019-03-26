library(nanop)


### Name: rss
### Title: Function to calculate the RSS between the simulated PDF or the
###   total scattering structure function and target data
### Aliases: rss simPartPar PDFPar TotalScattPar
### Keywords: fit

### ** Examples


part <- res_gQ <- res_gQ_WAS <- res_gQ_SAS <- list() 

## prepare polydisperse sample consisting of 30 particles:
size <- sort(rlnorm(20, meanlog = log(10), sdlog = log(1.1)))
base_Cu <- getBase("Cu")
Au <- createAtom("Au", base=base_Cu)

for(i in 1:20) {
  cat("r = ", size[i], "\n")
  part[[i]] <- simPart(atoms=list(Au), r=size[i], latticep=4.08, 
      rcenter=TRUE) 
  res_gQ_WAS[[i]] <- calcTotalScatt(part[[i]],minQ=.771, maxQ=20, 
      dr=0.02, dQ=0.02, sigma=c(0.02))							
  res_gQ_SAS[[i]] <- calcTotalScatt(part[[i]],minQ=.001, 
      dr=0.02, maxQ=.771, dQ=0.01, sigma=c(0.02))
  cat(i,"\n")
}

## calculate average values:
gQ_av_WAS <- 0
for(i in 1:length(res_gQ_WAS)) {
  gQ_av_WAS <- res_gQ_WAS[[i]]$gQ + gQ_av_WAS
}
gQ_av_WAS <- gQ_av_WAS/length(res_gQ_WAS)

gQ_av_SAS <- 0
for(i in 1:length(res_gQ_SAS)) {
  gQ_av_SAS <- res_gQ_SAS[[i]]$gQ + gQ_av_SAS
}
gQ_av_SAS <- gQ_av_SAS/length(res_gQ_SAS)

## calculate PDF and gamma baseline term
resSAS  <- calcQDepPDF(minR=0, maxR=30, dr=0.02, minQ=.001,
    maxQ=.771, verbose=100, 
    preTotalScat=list(Q=res_gQ_SAS[[1]]$Q,gQ=gQ_av_SAS))
  
mr <- which(res_gQ_WAS[[1]]$Q > 17)[1]
mxr <- which(res_gQ_WAS[[1]]$Q > 19)[1]
cuto <- res_gQ_WAS[[1]]$Q[mr:mxr][which(abs(gQ_av_WAS[mr:mxr])
    ==min(abs(gQ_av_WAS[mr:mxr]) ))[1] ]
resWAS <- calcQDepPDF(minR=0, maxR=30, dr=0.02, minQ=.771, 
    maxQ=cuto, verbose=100, 
    preTotalScat=list(Q=res_gQ_WAS[[1]]$Q,gQ=gQ_av_WAS))

## set boundaries for fitting procedure
iter_0 <- as.relistable(list(latticep=0, r=0, sigma=c(0), rsigma=0))
boundsL <- c(latticep=3.5,  r=10.0, sigma=c(.01), rsigma=1.1)
boundsU <- c(latticep=4.5,  r=14.0,  sigma=c(.03), rsigma=1.3)

## in order to estimate the parameters that were used to
## simulate the particles, the DEoptim package may be
## used. Install it, remove the comment symbols '#' below,
## and use a call like:
#library(DEoptim)

#resDE <- DEoptim(rss, lower = boundsL, upper = boundsU, 
#    oneDW=FALSE, type="neutron",                   
#    control=DEoptim.control(CR=0.85, F=0.7, NP=40, itermax=30, 
#        parallelType=1, packages = list("PerformanceAnalytics"),
#        parVar=list("rss", "simPart", "calcPDF", 
#        "IqSASP", "GrSAS", "GrSASCS", "broadPDF", "termRip",
#        "getSymEl", "IqSAS", "displacePart", "calcTotalScatt")),       
#    dataS=NA, dataSAS=gQ_av_SAS, dataG=resWAS$gr, 
#    simPar = simPartPar(atoms=list(Au), rcenter=TRUE, 
#        move=TRUE, rot=FALSE),
#    gammaR = resSAS$gr, rvector = resSAS$r, skel=iter_0, 
#    PDF.fixed=PDFPar(minR=0, maxR=30, dr=.01, 
#        scatterLength=Au$scatterLength),
#    TotalScatt.fixed=TotalScattPar(minQ=0.771, maxQ=20, 
#        dQ=0.02, dQ_SAS=0.01, minQ_SAS=.001, maxQ_SAS=.771, 
#        scatterLength=Au$scatterLength, kind="fastHist", 
#        SASscale="normal", convolution = FALSE),
#    wG=1.0, wSAS=0.05, avRes=10, pareto=FALSE) 
#
## now resDE$optim contains estimates for the lattice parameter,
## particle radius, displacement variance sigma, and standard 
## deviation rsigma.
## show results:
#resDE$optim$bestmem

## package mco may be used to construct a Pareto front of 
## solutions. Note that calculations may take considerable time!

#library(mco)
#resMCO <- nsga2(rss, 4, 2, 
#    dataS=NA, dataSAS=gQ_av_SAS, dataG=resWAS$gr,  oneDW=FALSE,
#    simPar = simPartPar(rcenter=TRUE, move=TRUE, rot=FALSE),
#    gammaR = resSAS$gr, rvector = resSAS$r, skel=iter_0,
#    PDF.fixed=PDFPar(minR=0, maxR=30, dr=.01, 
#        scatterLength=scatterLength),
#    TotalScatt.fixed=TotalScattPar(minQ=0.771, maxQ=20, dQ_SAS=0.01, 
#        dQ=.02, minQ_SAS=.001, maxQ_SAS=.771, scatterLength=scatterLength,
#        kind="fastHist", SASscale="normal", convolution = FALSE),
#    wG=1.0, wSAS=0.2, avRes=10, pareto=TRUE,							 
#    constraints=NULL, cdim=0, popsize=40, generations=c(40), 
#    cprob=0.85, lower.bounds=boundsL, upper.bounds=boundsU)

## show results
#plot(resMCO, xlab="SAS(Q) residual", ylab="G(r) residual")			
#paretoSet(resMCO)






