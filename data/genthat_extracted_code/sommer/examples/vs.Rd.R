library(sommer)


### Name: vs
### Title: variance structure
### Aliases: vs

### ** Examples


data(DT_example)
head(DT)

## ============================ ##
## example to use ds() structure (DIAGONAL)
## ============================ ##
ds(DT$Year)
mix <- mmer(Yield~Env, 
            random= ~ vs(ds(Year),Name),
            rcov=~ vs(ds(Year),units),
            data=DT)

## ============================ ##
## example to use at() structure (level-specific)
## ============================ ##
unique(DT$Year)
mix <- mmer(Yield~Env, 
            random= ~ vs(at(Year,c("2011","2012")),Name),
            rcov=~ vs(ds(Year),units),
            data=DT)

## ============================ ##
## example to use us() structure (UNSTRUCTURED)
## ============================ ##
us(DT$Year)
mix <- mmer(Yield~Env, 
            random= ~ vs(us(Year),Name),
            rcov=~ vs(ds(Year),units),
            data=DT)

## ============================ ##
## example to use cs() structure (CUSTOMIZED)
## ============================ ##
unique(DT$Year)
mm <- matrix(1,3,3); mm[1,3] <- mm[3,1] <- 0;mm #don't estimate cov 2011-2013
mix <- mmer(Yield~Env, 
            random= ~ vs(cs(Year,mm),Name),
            rcov=~ vs(ds(Year),units),
            data=DT)

## ============================ ##
## example to use overlay() + vs() structure
## ============================ ##
data("DT_halfdiallel")
head(DT)
DT$femalef <- as.factor(DT$female)
DT$malef <- as.factor(DT$male)
DT$genof <- as.factor(DT$geno)
A <- diag(7); colnames(A) <- rownames(A) <- 1:7;A # if you want to provide a covariance matrix
#### model using overlay
modh <- mmer(sugar~1, 
             random=~vs(overlay(femalef,malef), Gu=A) 
                     + genof,
              data=DT)

## ============================ ##
## example to use spl2D() + vs() structure
## ============================ ##            
# ### mimic two fields
# aa <- DT; bb <- DT
# aa$FIELD <- "A";bb$FIELD <- "B"
# set.seed(1234)
# aa$Yield <- aa$Yield + rnorm(length(aa$Yield),0,4)
# DT2 <- rbind(aa,bb)
# head(DT2)
# 
# mix <- mmer(Yield~1,
#             random=~vs(ds(FIELD),id, Gu=A) + 
#               vs(ds(FIELD),Rowf) +
#               vs(ds(FIELD),Colf) +
#                 vs(ds(FIELD),spl2D(Row,Col)),
#             rcov=~vs(ds(FIELD),units),
#             data=DT2)




