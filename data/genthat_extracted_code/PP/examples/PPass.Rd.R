library(PP)


### Name: PPass
### Title: Person Assessment function
### Aliases: PPass PPass.default PPass.Rm

### ** Examples


library(eRm)
### real data ##########

data(pp_amt)

d <- pp_amt$daten_amt

rd_res <- PPass(respdf = d, 
                items = 8:ncol(d),
                mod="1PL",
                thres = pp_amt$betas[,2], 
                fitindices = "lz")

head(rd_res)


## ========== RM - eRm 
my_data <- eRm::sim.rasch(200, 12)
my_rm <- eRm::RM(my_data)

res_pp1 <- PPass(my_rm)


## ========== PCM - eRm

set.seed(2751)

THRES  <- matrix(c(-2,-1.23,1.11,3.48,1
                   ,2,-1,-0.2,0.5,1.3,-0.8,1.5),nrow=2)
THRES <- rbind(THRES,c(-0.2,NA,NA,NA,NA,NA))

sl          <- rep(1,6)
THRESx      <- rbind(0,THRES)
THETA       <- rnorm(200)
simdat_gpcm <- sim_gpcm(thres = THRESx,alpha = sl,theta = THETA)

my_pcm <- eRm::PCM(simdat_gpcm)

res_pp2 <- PPass(my_pcm)

## ==========  1PL model

set.seed(1337)

# intercepts
diffpar <- seq(-3,3,length=15)
# slope parameters
sl     <- round(runif(15,0.5,1.5),2)
la     <- round(runif(15,0,0.25),2)
ua     <- round(runif(15,0.8,1),2)

# response matrix
awm <- matrix(sample(0:1,100*15,replace=TRUE),ncol=15)
awm <- as.data.frame(awm)
# estimate person parameter

# estimate person parameter and person fit
out <- PPass(respdf = awm,thres = diffpar, items="all",
             mod=c("1PL"), fitindices= c("lz","lzstar","infit","outfit"))

# show first rows
head(out)



