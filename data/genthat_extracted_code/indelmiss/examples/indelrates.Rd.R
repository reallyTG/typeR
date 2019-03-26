library(indelmiss)


### Name: indelrates
### Title: Function for estimating indel rates while accounting for missing
###   data.
### Aliases: indelrates

### ** Examples

###User supplied tree and data###
#Simulate data
library(phangorn)
set.seed(1)
usertree <- rtree(n = 7, br = rbeta(n = 7, shape1 = 1, shape2 = 7))
data <- simSeq(usertree, l = 5000, type = "USER", levels = c(0, 1), 
bf = c(1/(1 + 5), 5/(1 + 5)), Q = 1) #1 and 5 correspond to 
#unstandardized rates. See item help descriptions on mu and nu.
datab <- matrix(as.numeric(as.character(data)), nrow = 7)
userphyl <- t(datab)
#Run the models.
indel_user <- indelrates(datasource = "user", usertree = usertree, 
userphyl = userphyl, toi = 1, zerocorrection = TRUE, rootprob = "stationary", 
  modelnames = c("M3", "M4"), optmethod = "nlminb", 
control = list(trace = 10))
print(indel_user)

#####Simulation#####
#Simulate a dataset with default options and run algorithm.
indel1 <- indelrates(verbose = TRUE, datasource = "simulation", 
control = list(trace = 5))
print(indel1)
## Not run: 
##D #Estimate insertion/ deletion rates from gene presence/absence 
##D #data simulated on a simulated five taxon tree.
##D indel2 <- indelrates(datasource = "simulation", seed = 1, taxa = 5, 
##D brlensh = c(1, 8), mu = 1, nu = 5, phyl = 5000, pmiss = 0, toi = 1, 
##D zerocorrection = TRUE, rootprob = "stationary", 
##D modelnames = c("M1", "M2", "M3", "M4"), optmethod = "nlminb", 
##D control = list(trace = 5))#1 and 5 correspond to unstandardized rates. 
##D #See item help descriptions on mu and nu.
##D print(indel2)
##D 
##D #With toi="all"
##D indel3 <- indelrates(datasource = "simulation", seed = 1, taxa = 5, 
##D brlensh = c(1, 8), mu = 1, nu = 5, phyl = 5000, pmiss = c(0, 0.15, 0.25, 0, 0), toi = "all", 
##D zerocorrection = TRUE, rootprob = "maxlik", modelnames = c("M3", "M4"),
##D optmethod = "nlminb")
##D print(indel3)
##D #Compare with
##D indel3 <- indelrates(datasource = "simulation", seed = 1, taxa = 5, 
##D brlensh = c(1, 8), mu = 1, nu = 5, phyl = 5000, pmiss = c(0.15, 0.25), toi = c(2, 3), 
##D zerocorrection = TRUE, rootprob = "maxlik", modelnames = c("M3", "M4"),
##D optmethod = "nlminb")
##D print(indel3)
##D 
##D #Here, a vector of ancestor nodes specify the nodes which 
##D #along with all their descendants have unique indel rates.
##D 
##D indel4 <- indelrates(datasource = "simulation", seed = 1, taxa = 10, 
##D brlensh = c(1, 8), mu = 1, nu = 5, phyl = 5000, pmiss = 0, toi = 1, 
##D bgtype = "ancestornodes", bg = c(15), zerocorrection = TRUE, rootprob = 
##D "maxlik", modelnames = c("M3", "M4"), optmethod = "nlminb")
##D print(indel4)
##D plot(indel4, model = "M4")
##D 
##D #Above command prints two plots that can be obtained individually.
##D #These are confidence intervals based on asymptotic normality 
##D #of the maximum likelihood estimators. 
##D #Different confidence interval levels can be specified with the cil option.
##D plotrates(indel4, model = "M4", ci = TRUE, cil = 95)
##D plotp(indel4, model = "M4", ci = TRUE, cil = 95)
##D 
##D #This is an alternate (more flexible but potentially less user-friendly) 
##D #way to specify groups of nodes which have unique indel rates. 
##D #A list of nodes is used here.
##D 
##D indel5 <- indelrates(verbose = TRUE, datasource = "simulation", seed = 1, 
##D taxa = 5, brlensh = c(1, 8), mu = 1, nu = 3, phyl = 5000, pmiss = 0, 
##D toi = 1, bgtype = "listofnodes", bg = list(c(7, 1, 2), 
##D c(6, 8, 3, 7, 9, 5, 4, 9)), zerocorrection = TRUE, rootprob = "maxlik",
##D modelnames = c("M1", "M2", "M3", "M4"), optmethod = "nlminb")
##D 
##D #Mycobacterium data example
##D  data(mycobacteriumdata1)
##D  indel_myco <- indelrates(verbose = TRUE, usertree = mycobacteriumdata1$tree, modelnames = "M4",
##D     userphyl = mycobacteriumdata1$phyl, matchtipstodata = TRUE, 
##D     datasource = "user", toi = c(3:4, 6:10), bgtype = "listofnodes", 
##D     zerocorrection = TRUE, rootprob = "stationary", optmethod = "nlminb", 
##D     numhessian = TRUE, control = list(eval.max = 50000, iter.max = 50000))
## End(Not run)



