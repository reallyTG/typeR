library(TIMP)


### Name: preProcess
### Title: Performs preprocessing on data stored as an objects of class
###   dat.
### Aliases: preProcess
### Keywords: file

### ** Examples

##############################
## READ DATA
##############################

data("target")

##############################
## PREPROCESS DATA
##############################

# select certain wavelengths for modeling 

C1_1 <- preProcess(data = C1, baselinelambda = c(1,12,1,32) )
C1_1 <- preProcess(data = C1_1, sel_lambda = c(8, 27))
C1_1 <- preProcess(data = C1_1, rm_x = c(40, 41, 101, 116))
C1_1 <- preProcess(data = C1_1, sel_time_ab = c(-10, 100000))

C2_1 <- preProcess(data = C2, sel_lambda = c(2, 32))
C2_1 <- preProcess(data = C2_1, baselinelambda = c(1,12,1,32) )
C2_1 <- preProcess(data = C2_1, sel_time_ab = c(-10, 100000))

C3_1 <- preProcess(data = C3, sel_lambda = c(1, 25))
C3_1 <- preProcess(data = C3_1, baselinelambda = c(1,12,1,32) )

## Not run: 
##D 
##D ##############################
##D ## SPECIFY K Matrix and J vector 
##D ##############################
##D 
##D 
##D ## initialize 2 7x7 arrays to 0 
##D 
##D delK <- array(0, dim=c(7,7,2))
##D 
##D ## the matrix is indexed: 
##D ## delK[ ROW K MATRIX, COL K MATRIX, matrix number] 
##D 
##D ## in the first matrix, put the index of compartments 
##D ## that are non-zero
##D ## the transfer rate of the compartment is governed by
##D ## kinpar[index] 
##D 
##D delK[1,1,1] <- 4
##D delK[5,1,1] <- 1
##D delK[2,2,1] <- 4
##D delK[5,2,1] <- 2
##D delK[3,3,1] <- 4
##D delK[5,3,1] <- 3
##D delK[4,4,1] <- 4
##D delK[6,5,1] <- 5
##D delK[7,6,1] <- 6
##D delK[7,7,1] <- 7
##D 
##D ## print out the resulting array to make sure it's right
##D 
##D delK
##D 
##D jvector <- c(.48443195136500550341, .28740782363398824522, 
##D .13749071230100625137, 0.9066953510E-01, 0, 0, 0)
##D 
##D datalist <- list(C1, C2, C3)
##D ## for plotting selected traces, get a vector of all the wavenumbers 
##D allx2 <- vector()
##D for(i in 1:length(datalist)) 
##D 	allx2 <- append(allx2,datalist[[i]]@x2)
##D allx2 <- sort(unique(allx2))
##D 
##D ##############################
##D ## SPECIFY INITIAL MODEL
##D ## note that low is the larger wavenumber in the clpequ spec! 
##D ##############################
##D 
##D model1 <- initModel(mod_type = "kin", 
##D kinpar=c( 0.13698630, 0.3448275849E-01, 0.1020408142E-01, 0.2941176528E-02, 
##D 0.17000,  0.015,  0.1074082902E-03), 
##D fixed = list(prel = 1:6, clpequ=1:3, kinpar=1:7, irfpar=1, parmu=1),  
##D irfpar=c(0.4211619198, 0.6299000233E-01), 
##D prelspec = list(
##D list(what1="kinpar", ind1=1, what2 = "kinpar", ind2=4,
##D start=c(-1,0.1369863003)), 
##D list(what1="kinpar", ind1=2, what2 = "kinpar", ind2=4,
##D start=c(-1,0.3448275849E-01)), 
##D list(what1="kinpar", ind1=3, what2 = "kinpar", ind2=4,
##D start=c(-1,0.1020408142E-01))
##D ), 
##D parmu = list(c(-0.1411073953)), 
##D lambdac = 1290,
##D kmat = delK,
##D jvec = jvector,
##D positivepar="kinpar",
##D weightpar=list( c(-20,1.4,1,2000,.2)), 
##D clpequspec =list(
##D list(to=2, from=1, low=100, high=10000), 
##D list(to=3, from=1, low=100, high=10000),
##D list(to=4, from=1, low=100, high=10000)),
##D clpequ = c(1,1,1),
##D cohspec = list( type = "irf"))
##D 
##D ##############################
##D ## GET RESID 
##D ## same format as call to fitModel, but does not plot
##D ##############################
##D 
##D serResid <- getResid(list(C1_1, C2_1, C3_1), list(model1), 
##D modeldiffs = list(thresh =  0.00005, 
##D dscal = list(list(to=2,from=1,value=4), 
##D list(to=3,from=1,value=0.8000000119)),  
##D free = list(
##D list(what="irfpar", ind=1, start= c(0.1231127158), dataset=2),
##D list(what="parmu", ind=c(1,1), start= c(0.1219962388), dataset=2),
##D list(what="irfpar", ind=1, start= c(0.3724052608), dataset=3),
##D list(what="parmu", ind=c(1,1), start= c(0.8844097704E-01), dataset=3)), 
##D change  = list(
##D list(what="fixed", spec=list(clpequ=1:3, kinpar=1:7, irfpar=1:2, 
##D parmu=1, drel = 1, prel=1:6), dataset=2:3))),  
##D opt=kinopt(iter=0, title="Cosimo Spectra, Not Normalized, with Error", 
##D stderrclp=TRUE, kinspecerr=TRUE, writespec = TRUE, 
##D plotkinspec = TRUE,plotcohcolspec=FALSE,
##D selectedtraces = seq(1, length(allx2), by=2), 
##D specinterpol = TRUE, specinterpolpoints=FALSE,
##D divdrel=TRUE, xlab="wavenumber",writeclperr = TRUE,
##D makeps = "err", linrange = 1, superimpose=1:3))
##D 
##D ##############################
##D ## MAKE CORRECTED DATASETS USING RESID INFO
##D ##############################
##D 
##D C1_3 <- preProcess(data = C1_1, svdResid = serResid[[1]], numV = 2)
##D C2_3 <- preProcess(data = C2_1, svdResid = serResid[[2]], numV = 2)
##D C3_3 <- preProcess(data = C3_1, svdResid = serResid[[3]], numV = 2)
##D 
##D ##############################
##D ## FIT MODEL 
##D ##############################
##D 
##D serRes<-fitModel(list(C1_3, C2_3, C3_3), list(model1), 
##D modeldiffs = list(thresh =  0.00005, 
##D dscal = list(list(to=2,from=1,value=4), 
##D list(to=3,from=1,value=0.8000000119)),  
##D free = list(
##D list(what="irfpar", ind=1, start= c(0.1231127158), dataset=2),
##D list(what="parmu", ind=c(1,1), start= c(0.1219962388), dataset=2),
##D list(what="irfpar", ind=1, start= c(0.3724052608), dataset=3),
##D list(what="parmu", ind=c(1,1), start= c(0.8844097704E-01), dataset=3)), 
##D change  = list(
##D list(what="fixed", spec=list(clpequ=1:3, kinpar=1:7, irfpar=1:2, 
##D parmu=1, drel = 1, prel=1:6), dataset=2:3))),  
##D opt=kinopt(iter=0, title="Cosimo Spectra, Not Normalized, with Error", 
##D stderrclp=TRUE, kinspecerr=TRUE, writespec = TRUE, 
##D plotkinspec = TRUE,plotcohcolspec=FALSE, writerawcon = TRUE,
##D selectedtraces = seq(1, length(allx2), by=2), 
##D specinterpol = TRUE, specinterpolpoints=FALSE,
##D divdrel=TRUE, xlab="wavenumber",writeclperr = TRUE,
##D makeps = "h20", linrange = 1, superimpose=1:3))
##D 
## End(Not run)



