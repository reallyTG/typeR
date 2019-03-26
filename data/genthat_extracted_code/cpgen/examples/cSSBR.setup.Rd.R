library(cpgen)


### Name: cSSBR.setup
### Title: Preparing Model terms for Single Step Bayesian Regression
### Aliases: cSSBR.setup
### Keywords: Genomic Prediction

### ** Examples


# example dataset

id <- 1:6
sire <- c(rep(NA,3),rep(1,3))
dam <- c(rep(NA,3),2,2,3)

# phenotypes
y <- c(NA, 0.45, 0.87, 1.26, 1.03, 0.67)

dat <- data.frame(id=id,sire=sire,dam=dam,y=y)


# Marker genotypes
M <- rbind(c(1,2,1,1,0,0,1,2,1,0),
           c(2,1,1,1,2,0,1,1,1,1),
           c(0,1,0,0,2,1,2,1,1,1))

M.id <- 1:3

model_terms <- cSSBR.setup(dat,M, M.id)

var_y <- var(y,na.rm=TRUE)
var_e <- (10*var_y / 21)
var_a <- var_e 
var_m <- var_e / 10

# put emphasis on the prior
df = 500

par_random=list(list(method="ridge",scale=var_m,df = df),list(method="ridge",scale=var_a,df=df))

set_num_threads(1)

# passing model terms to 'clmm'
mod<-clmm(y=model_terms$y, 
          Z=list(model_terms$Marker_Matrix,model_terms$Z_residual),
          ginverse = list(NULL, model_terms$ginverse_residual),
          par_random=par_random,
          scale_e = var_e,
          df_e=df,
          niter=50000,
          burnin=30000)
          
# check marker effects
print(round(mod[[4]]$posterior$estimates_mean,digits=2))





