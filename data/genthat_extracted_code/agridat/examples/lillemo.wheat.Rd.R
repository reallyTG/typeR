library(agridat)


### Name: lillemo.wheat
### Title: Multi-environment trial of wheat susceptibile to powdery mildew
### Aliases: lillemo.wheat
### Keywords: datasets

### ** Examples


data(lillemo.wheat)
dat <- lillemo.wheat

# Change factor levels to match Lillemo
dat$env <- as.character(dat$env)
dat$env <- factor(dat$env,
                  levels=c("Bj03","Bj05","CA03","Ba04","Ma04",
                           "Kh06","Gl05","BT06","Ch04","Ce04",
                           "Ha03","Ha04","Ha05","Ha07","Aa03","Aa04","Aa05"))
# Interesting look at different measurement scales by environment
require(lattice)
qqmath(~score|env, dat, group=scale,
       as.table=TRUE, scales=list(y=list(relation="free")),
       auto.key=list(columns=4),
       main="lillemo.wheat - QQ plots by environment")

# ----------------------------------------------------------------------------

## Not run: 
##D   # Change data to matrix format
##D   require(reshape2)
##D   datm <- acast(dat, gen~env, value.var='score')
##D   
##D   # Environment means. Matches Lillemo Table 3
##D   apply(datm, 2, mean)
##D   
##D   # Two different transforms within envts to approximate 0-9 scale
##D   datt <- datm
##D   datt[,"CA03"] <- 1.8 * datt[,"CA03"]
##D   ix <- c("Ba04","Kh06","Gl05","BT06","Ha03","Ha04","Ha05","Ha07","Aa03","Aa04","Aa05")
##D   datt[,ix] <- apply(datt[,ix],2,sqrt)
##D 
##D   # Genotype means of transformed data. Matches Lillemo table 3.
##D   round(rowMeans(datt),2)
##D 
##D   # Biplot of transformed data like Lillemo Fig 2
##D   require(gge)
##D   biplot(gge(datt, scale=FALSE), main="lillemo.wheat")
##D   
##D   # Median polish of transformed table
##D   m1 <- medpolish(datt)
##D   # Half-normal prob plot like Fig 1
##D   # require(faraway)
##D   # halfnorm(abs(as.vector(m1$resid)))
##D 
##D   # Nonparametric stability statistics. Lillemo Table 4.
##D   huehn <- function(mat){
##D     # Gen in rows, Env in cols  
##D     nenv <- ncol(mat)
##D     # Corrected yield. Remove genotype effects
##D     # Remove the following line to match Table 4 of Lillemo
##D     mat <- sweep(mat, 1, rowMeans(mat)) + mean(mat)
##D     # Ranks in each environment
##D     rmat <- apply(mat, 2, rank)
##D     
##D     # Mean genotype rank across envts
##D     MeanRank <- apply(rmat, 1, mean)
##D     
##D     # Huehn S1
##D     gfun <- function(x){
##D       oo <- outer(x,x,"-")
##D       sum(abs(oo)) # sum of all absolute pairwise differences
##D     }
##D     S1 <- apply(rmat, 1, gfun)/(nenv*(nenv-1))
##D     
##D     # Huehn S2
##D     S2 <- apply((rmat-MeanRank)^2,1,sum)/(nenv-1)
##D     
##D     out <- data.frame(MeanRank,S1,S2)
##D     rownames(out) <- rownames(mat)
##D     return(out)
##D   }
##D   round(huehn(datm),2) # Matches table 4
##D   
##D   # I do not think phenability package gives correct values for S1
##D   # require(phenability)
##D   # nahu(datm)
##D   
## End(Not run)



