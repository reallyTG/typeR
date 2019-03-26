library(immer)


### Name: immer_FACETS
### Title: Wrapper to FACDOS
### Aliases: immer_FACETS summary.immer_FACETS

### ** Examples

## Not run: 
##D ################################
##D # 1. Example on Windows
##D ################################
##D # define data generating parameters
##D set.seed(1997)
##D N <- 500  # number of persons
##D I <- 4    # number of items
##D R <- 3    # number of raters
##D K <- 3    # maximum score
##D sigma <- 2  # standard deviation
##D theta <- rnorm( N, sd=sigma )  # abilities
##D # item intercepts
##D b <- outer( seq( -1.5, 1.5, len=I), seq( -2, 2, len=K), "+" )
##D # item loadings
##D a <- rep(1,I)
##D # rater severity parameters
##D phi <- matrix( c(-.3, -.2, .5), nrow=I, ncol=R, byrow=TRUE )
##D phi <- phi + rnorm( phi, sd=.3 )
##D phi <- phi - rowMeans(phi)
##D # rater variability parameters
##D psi <- matrix( c(.1, .4, .8), nrow=I, ncol=R, byrow=TRUE )
##D # simulate HRM data
##D data <- immer::immer_hrm_simulate( theta, a, b, phi=phi, psi=psi )
##D 
##D # prepare data for FACETS
##D data2FACETS <- function(data){
##D   tmp <- match(c("pid","rater"),colnames(data))
##D   items <- grep("I",colnames(data))
##D cbind(data[, match(c("pid","rater"),
##D colnames(data))],gr=paste0("1-",length(items)),data[,items])
##D }
##D facets_in <- data2FACETS(data)
##D 
##D # Example of FACETS
##D mod1.a <- immer::immer_FACETS(
##D   title="Example 1 with simulated data",
##D   convergence=NULL,
##D   totalscore="YES",
##D   facets=3,
##D   noncenter=NULL,
##D   arrange="m,N",
##D   entered_in_data="2,1,1",
##D   models="?$,?$,?$,R4",
##D   inter_rater=NULL,
##D   pt_biserial=NULL,
##D   faire_score="Zero",
##D   unexpected=2,
##D   usort=NULL,
##D   positive=1,
##D   labels=c("1,Persons","1-500","2,Rater","1-3","3,Item","1-4"),
##D   fileinput=NULL,
##D   data=facets_in,
##D   path.dosbox=NULL,
##D   path.facets="C:\\Facets",
##D   model.name="Example.SD",
##D   facetsEXE=NULL
##D   )
##D 
##D ################################
##D # 2. Example on Windows using existing input-files of FACETS
##D ################################
##D data(data.immer06)
##D 
##D mod1b <- immer::immer_FACETS(
##D   fileinput=data.immer06,
##D   path.facets="C:\\Facets",
##D   model.name="Example.SD",
##D   facetsEXE=NULL
##D   )
## End(Not run)



